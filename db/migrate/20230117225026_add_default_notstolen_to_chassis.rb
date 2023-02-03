class AddDefaultNotstolenToChassis < ActiveRecord::Migration[7.0]
  def change
    change_column_default :chassis, :stolen, false
  end
end
