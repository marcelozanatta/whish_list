class Category < ApplicationRecord
    belongs_to :parent , :class_name => "Category", :foreign_key => "parent_id", optional: true
    has_one :child, :class_name => "Category", :foreign_key => "parent_id" 

    has_many :products, class_name: "product", foreign_key: "reference_id"
end
