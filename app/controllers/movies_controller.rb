class MoviesController < ApplicationController
	include FileManage
	require 'roo'

	def import_excel
		excel = write_data(params[:file])
		render json: send_data(data: excel)
	end

	def excel_process_data
		excel = ExcelDatum.can_process
		render json: send_data(data: excel)
	end

	def process_excel
		unzip_data(ExcelDatum.first.file_name)
		xlsx = Roo::Spreadsheet.open("#{Rails.root}/storage/data/Movie.xlsx")
		xlsx.sheet('Sheet1').each_with_index(name: 'Name', category: 'Category', tag: 'Tag', location: 'Location', hdd: 'HDD', caculate: 'Caculate', description: 'Description', isNeedUpdate: 'isNeedUpdate') do |data, i|
			next if i == 0
			Movie.import_data_with_hash(data)
		end
	end

	def movies
		movies = Movie.compress_data
		render json: send_data(data: movies)
	end
end
