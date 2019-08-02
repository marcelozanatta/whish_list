class Category < ApplicationRecord
  belongs_to :parent, :class_name => "Category", :foreign_key => "parent_id"

  has_many :childrens, class_name: "Category", foreign_key: "parent_id", dependent: :destroy

  has_many :products, class_name: "product", foreign_key: "reference_id"

  def self.get_category_tree_ids(category_id, ids)
    ids.push(category_id)

    begin
      category = Category.find(category_id)
    rescue ActiveRecord::RecordNotFound => e
      category = nil
    end
    if (category)
      category.childrens.each do |child|
        ids.push(get_category_tree_ids(child.id, ids))
      end
    end
    return ids
  end
end
