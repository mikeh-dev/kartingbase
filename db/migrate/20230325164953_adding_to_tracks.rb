class AddingToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :description, :text
    add_column :tracks, :address, :string
    add_column :tracks, :postcode, :string
    add_column :tracks, :city, :string
    add_column :tracks, :country, :string
    add_column :tracks, :phone, :string
    add_column :tracks, :email, :string
    add_column :tracks, :website, :string
    add_column :tracks, :facebook, :string
    add_column :tracks, :twitter, :string
    add_column :tracks, :instagram, :string
    add_column :tracks, :youtube, :string
    add_column :tracks, :length, :integer
  end
end
