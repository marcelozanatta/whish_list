class Product < ApplicationRecord
  belongs_to :category

  def get_category_ids(category_id, ids)
    category = Category.find(category_id)
    ids.push(category.id)
    category.childrens.each do |child|
        nodes.push(generate_category_tree(child))
    end
  end

  def get_by_category(category_id)
    Product.where(category_id in get_category_ids(category_id,[]))
  end

end
