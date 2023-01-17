class AddChassisNumberToChassis < ActiveRecord::Migration[7.0]
  def change
    add_column :chassis, :number, :string
  end
end
