class CreateProductPersonalWhishLists < ActiveRecord::Migration[5.2]
  def change
    create_table :product_personal_whish_lists do |t|
      t.string :product
      t.string :Product
      t.PersonalWishList :personal_wish_list

      t.timestamps
    end
  end
end
