class AddAvatarToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :avatar, :string
  end
end
