module FileManage
	require 'shellwords'

	def write_data(file)
		ExcelDatum.transaction do
			File.write("#{Rails.root}/storage/#{file.original_filename}", file.read.encode("ASCII-8BIT").force_encoding("utf-8"))
			ExcelDatum.any? ? ExcelDatum.first.update({ file_name: file.original_filename, is_processed: 0 }) : ExcelDatum.create({ file_name: file.original_filename })
			ExcelDatum.first
		end
	end

	def unzip_data(file_name)
		Zip::File.open("#{Rails.root}/storage/#{file_name}") do |zip_file|
	    zip_file.each do |f|
		    f_path = File.join("#{Rails.root}/storage/", f.name)
		    FileUtils.mkdir_p(File.dirname(f_path))
		    zip_file.extract(f, f_path) unless File.exist?(f_path)
		  end
	  end
	end

	def remove_space(file_path)
		Shellwords.shellescape file_path
	end
	
end