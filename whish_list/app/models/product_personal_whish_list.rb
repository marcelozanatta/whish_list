class ProductPersonalWhishList < ApplicationRecord
  belongs_to :personal_whish_list, class_name: "PersonalWhishList", foreign_key: "personal_whish_list_id"
  belongs_to :product, class_name: "Product", foreign_key: "product_id"
end
