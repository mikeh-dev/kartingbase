class ChangeEntriesInTracks < ActiveRecord::Migration[7.0]
  def change
      remove_column :tracks, :entries_id
      add_reference :tracks, :entry, null: true, foreign_key: true
  end
end
