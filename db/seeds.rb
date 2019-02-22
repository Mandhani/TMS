# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Usertype.create(user_type: 'admin')
Usertype.create(user_type: 'customer')
Usertype.create(user_type: 'agent')

User.create(email: 'admin@tms.com', password: 'password', user_type: 1)