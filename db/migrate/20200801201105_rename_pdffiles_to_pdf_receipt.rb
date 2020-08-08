class RenamePdffilesToPdfReceipt < ActiveRecord::Migration[6.0]
  def change
    rename_column :receipts, :pdffile, :receipt_files
  end
end
