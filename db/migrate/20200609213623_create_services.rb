class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.datetime :service_date
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
