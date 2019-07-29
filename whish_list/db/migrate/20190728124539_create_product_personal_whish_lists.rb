class CreateProductPersonalWhishLists < ActiveRecord::Migration[5.2]
  def change
    create_table :product_personal_whish_lists do |t|
      t.references :product, :null =>  false
      t.references :personal_whish_list, :null => false
      t.decimal :quantity, precision: 10, scale: 2
      t.timestamps
    end
  end
end
