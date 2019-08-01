class Category < ApplicationRecord
  belongs_to :parent, :class_name => "Category", :foreign_key => "parent_id"

  has_many :childrens, class_name: "Category", foreign_key: "parent_id", dependent: :destroy

  has_many :products, class_name: "product", foreign_key: "reference_id"
end
