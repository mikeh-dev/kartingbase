class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.integer :run
      t.text :sessionnotes

      t.timestamps
    end
  end
end
