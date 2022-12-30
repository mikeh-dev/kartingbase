class CreateChassis < ActiveRecord::Migration[7.0]
  def change
    create_table :chassis do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.boolean :stolen

      t.timestamps
    end
  end
end
