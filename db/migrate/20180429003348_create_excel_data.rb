class CreateExcelData < ActiveRecord::Migration[5.1]
  def change
    create_table :excel_data do |t|
    	t.string :file_name
    	t.integer :is_processed, default: 0
      t.timestamps
    end
  end
end
