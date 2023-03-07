class ChangeEntriesIdInTracksNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tracks, :entries_id, true
  end
end

