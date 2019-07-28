# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.all.count

if(categories == 0)
    category = Category.create({name: 'Utilidades do Lar' , parent_id: nil})
    Category.create([
        {name: 'Decoração' , parent_id: category.id},
        {name: 'Mesa e Bar' , parent_id: category.id},
        {name: 'Lavanderia e Banheiro' , parent_id: category.id},
        {name: 'Copa e Cozinha' , parent_id: category.id},
        {name: 'Forno e Fogão' , parent_id: category.id},
        {name: 'Cutelaria' , parent_id: category.id}
    ])

    category = Category.create({name: 'Cama, Mesa e Banho' , parent_id: nil})
    Category.create([
        {name: 'Cama' , parent_id: category.id},
        {name: 'Banho' , parent_id: category.id},
        {name: 'Mesa' , parent_id: category.id},
        {name: 'Decoração' , parent_id: category.id}
    ])
end

products = Product.all.count
if(products == 0)
    categories = Category.where.not(parent_id: nil)

    list_products = []

    for i in 0..1000
        sorted_category = categories[rand(0..(categories.length - 1))]

        list_products.push({name: 'Produto_' + sorted_category.name + '_' + i.to_s, price: rand(2.1..700.0), category: sorted_category})

    end
    
    Product.create(list_products)
end


