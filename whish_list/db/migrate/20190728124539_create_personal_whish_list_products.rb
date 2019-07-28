class CreatePersonalWhishListProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_whish_list_products do |t|
      t.references :product, :null =>  false
      t.references :personal_whish_list, :null => false
      t.decimal :quantity, precision: 10, scale: 2
      t.timestamps
    end
  end
end
