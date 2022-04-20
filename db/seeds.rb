# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.new(
	:email                 => "admin@admin.test",
  :password              => "123456",
  :password_confirmation => "123456",
	admin: true
)
user.save!

Category.create(name: "Beverages")
Category.create(name: "Snacks")
Category.create(name: "Sweets")
Category.create(name: "Rice")
Category.create(name: "Chicken & Duck")
Category.create(name: "Fast Food")
Category.create(name: "Bakery")
Category.create(name: "Japanese")
Category.create(name: "Bakso & Soto")
Category.create(name: "Korean")
Category.create(name: "Noodles")
Category.create(name: "Coffee")
Category.create(name: "Martabak")
Category.create(name: "Pizza")
Category.create(name: "Chinese")
Category.create(name: "Western")
Category.create(name: "Indian")
Category.create(name: "Thai")
Category.create(name: "Seafood")

Menu.create(name: "Chicken Curry", price: 15000, description:"a dish originating from the Indian subcontinent. It is common in the Indian subcontinent, Southeast Asia, Great Britain, and the Caribbean.")
CategoriesMenu.create(category_id: 5, menu_id: 1)
CategoriesMenu.create(category_id: 17, menu_id: 1)
Menu.create(name: "Jjapaguri", price: 17000, description:"a Korean noodle dish made by a combination of Chapagetti and Neoguri, two types of instant noodles produced by Nongshim.")
CategoriesMenu.create(category_id: 10, menu_id: 2)
CategoriesMenu.create(category_id: 11, menu_id: 2)
Menu.create(name: "Soto Lamongan", price: 21000, description:"One of Indonesia's most popular chicken soups. Served with glass noodles and a delicious broth flavored.")
CategoriesMenu.create(category_id: 9, menu_id: 3)
Menu.create(name: "Tom Yum", price: 33000, description:" a type of hot and sour Thai soup, usually cooked with shrimp. Tom yum has its origin in Thailand.")
CategoriesMenu.create(category_id: 18, menu_id: 4)
CategoriesMenu.create(category_id: 19, menu_id: 4)
Menu.create(name: "Oyakodon", price: 28000, description:"a Japanese rice bowl dish, in which chicken, egg, sliced scallion, and other ingredients are all simmered together in a kind of soup.")
CategoriesMenu.create(category_id: 4, menu_id: 5)
CategoriesMenu.create(category_id: 5, menu_id: 5)
CategoriesMenu.create(category_id: 8, menu_id: 5)

