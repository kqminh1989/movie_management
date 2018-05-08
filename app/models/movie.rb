class Movie < ApplicationRecord
	belongs_to :category
	has_many :movie_tags
	has_many :tags, :through => :movie_tags
	has_many :pictures, :as => :imageable

	def self.import_data_with_hash(data)
		# Add category
		category = Category.find_or_create_by(name: data[:category])
		
		# Add Movie
		movie = Movie.find_or_create_by(title: data[:name]) do |movie|
			movie.category    = category
			movie.caculate    = data[:caculate]
			movie.hdd         = data[:hdd]
			movie.location    = data[:location]
			movie.description = data[:description]
		end

		# Add Tag
		tags = data[:tag].split(',')
		tags.each do |tag|
			movie.tags << Tag.find_or_create_by(name: tag.downcase.strip)
		end

		# Add Image
		folder_name = ExcelDatum.first.file_name.split('.').first
		image_path  = "#{Rails.root}/storage/#{folder_name}/#{data[:name]}/avatar.jpg"
		movie.pictures.find_or_create_by(name: 'avatar') do |picture|
			picture.avatar = File.open(image_path)
		end
	end

	def compress_data(limit = 10, offset = 0)

	end
end
