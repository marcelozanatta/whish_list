require "test_helper"

class ProductPersonalWhishListsHelperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  include ProductPersonalWhishListsHelper

  test "generate tree view" do
    tree = [
      {
        text: "Categoria1",
        href: "teste/1",
        node: [
          {
            text: "Categoria2",
            href: "teste/2",
          },
          {
            text: "Categoria3",
            href: "teste/3",
          },
        ],
      },
      {
        text: "Categoria4",
        href: "teste/4",
        node: [
          {
            text: "Categoria5",
            href: "teste/5",
            node: [
              {
                text: "Categoria6",
                href: "teste/6",
              },
              {
                text: "Categoria7",
                href: "teste/7",
              },
            ],
          },
        ],
      },
    ]

    categories = Category.all
    assert_equal tree, ProductPersonalWhishListsHelper.generate_category_tree(categories)
  end
end
