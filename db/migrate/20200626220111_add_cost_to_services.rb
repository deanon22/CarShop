class AddCostToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :cost, :decimal
  end
end
