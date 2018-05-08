class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.text :hdd
      t.text :caculate
      t.text :location
      t.belongs_to :category

      t.timestamps
    end
  end
end
