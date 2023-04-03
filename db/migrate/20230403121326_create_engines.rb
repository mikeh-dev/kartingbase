class CreateEngines < ActiveRecord::Migration[7.0]
  def change
    create_table :engines do |t|
      t.string :name
      t.string :number
      t.string :barrel
      t.string :tag

      t.timestamps
    end
  end
end
