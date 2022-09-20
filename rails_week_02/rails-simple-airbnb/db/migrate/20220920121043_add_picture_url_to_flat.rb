class AddPictureUrlToFlat < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :picture_url, :string, default: "https://picsum.photos/id/#{rand(1..100)}/1200"
  end
end
