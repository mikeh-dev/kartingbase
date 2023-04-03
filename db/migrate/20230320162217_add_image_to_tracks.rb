class AddImageToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :image, :string
  end
end
