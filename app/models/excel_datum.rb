class ExcelDatum < ApplicationRecord

	def self.can_process
		find_by(is_processed: 0)
	end
end
