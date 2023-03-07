class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.references :entries, null: false, foreign_key: true

      t.timestamps
    end
  end
end
