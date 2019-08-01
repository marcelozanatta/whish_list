class Product < ApplicationRecord
  belongs_to :category

  def self.get_category_ids(category_id, ids)
    ids.push(category_id)
    category = Category.find(category_id)
    category.childrens.each do |child|
      ids.push(get_category_ids(child.id))
    end
    return ids
  end

  def self.get_by_category(category_id)
    return Product.where(category_id: get_category_ids(category_id, []))
  end
end
