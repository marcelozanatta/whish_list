class ProductPersonalWhishList < ApplicationRecord
    has_one :personal_whish_list, class_name: "personal_whish_list", foreign_key: "personal_whish_list_id"
    has_many :products, class_name: "product", foreign_key: "product_id"
end
