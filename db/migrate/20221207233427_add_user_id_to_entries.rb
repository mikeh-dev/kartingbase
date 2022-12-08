class AddUserIdToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :user_id, :int
  end
end
