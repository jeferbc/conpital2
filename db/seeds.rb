# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Category.create([{name: "Restaurant"}, {name: "Grocery"}, {name: "Car"}, {name: "Services"}, {name: "Home"}, {name: "Education"}, {name: "Fun"}, {name: "Travel"}])
TransactionType.create([{name: "Purchase"}, {name: "Withdrawal"}, {name: "Transfer"}, {name: "Payment"}])

100.times do 
  User.create(email: Faker::Internet.email, password: Faker::Internet.password(8))
  Expense.create(user: User.all.sample, amount: Faker::Number.between(100000, 1000000), concept: Faker::Commerce.product_name, date: Faker::Time.between(6.months.ago, Date.today, :all), category: Category.all.sample, transaction_type: TransactionType.all.sample)
end