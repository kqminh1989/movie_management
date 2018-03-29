class CreateMovieTags < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_tags do |t|
      t.belongs_to :movie, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
