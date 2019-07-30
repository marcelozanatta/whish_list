class PersonalWhishList < ApplicationRecord
    has_many :product_personal_whish_lists
    has_many :products, through: :product_personal_whish_lists
end
