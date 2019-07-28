class Category < ApplicationRecord
    belongs_to :parent , :class_name => "Category", :foreign_key => "parent_id", optional: true
    has_one :child, :class_name => "Category", :foreign_key => "parent_id" 
end
