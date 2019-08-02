class Product < ApplicationRecord
  belongs_to :category

  paginates_per 12

  def self.get_by_category(category_id)
    categories = Category.get_category_tree_ids(category_id, [])
    return Product.where(category_id: categories)
  end
end
