# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  Indicator.create(name:"Cold Calls", goal:20)

  Indicator.create(name:"Registered Apointments", goal:10)

  Indicator.create(name:"Sales Visits", goal:5)

  Indicator.create(name:"Demo Meeting", goal:5)

  Indicator.create(name:"Qoutes Issued", goal:20)AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?