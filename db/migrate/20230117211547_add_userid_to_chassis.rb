class AddUseridToChassis < ActiveRecord::Migration[7.0]
  def change
    add_reference :chassis, :user, foreign_key: true
  end
end
