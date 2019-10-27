class AddUserToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :user_updated_price, :integer
    remove_column :products, :price_id, :integer
  end
end
