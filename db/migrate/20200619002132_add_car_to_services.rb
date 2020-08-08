class AddCarToServices < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :car, null: true, foreign_key: true
  end
end
