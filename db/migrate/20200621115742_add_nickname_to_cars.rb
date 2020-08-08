class AddNicknameToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :nickname, :string
  end
end
