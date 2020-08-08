class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :name
      t.string :pdffile
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
