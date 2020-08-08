class AddPartsToServices < ActiveRecord::Migration[6.0]
  def change
    add_reference :parts, :service, null: true, foreign_key: true

  end
end
