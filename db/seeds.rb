# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING ROLES'
Role.create([
                { :name => 'admin' },
                { :name => 'user' },
                { :name => 'VIP' }
            ], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :first_name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.email
user2 = User.create! :first_name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2.email
user3 = User.create! :first_name => 'customer', :email => 'customer@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user3.email

user.add_role :admin
user2.add_role :VIP
user3.add_role :user

product1 = Product.create! :name => "pizza1", :picture => "u1tjyiqpz91dxx4yj3ti.jpg",
                           :product_type => 1, :price => 12.90, :description => "some description here"
puts "product create successful" << product1.name
product2 = Product.create! :name => "pizza2", :picture => "prworcnmzw2qnjl53fmx.jpg",
                           :product_type => 1, :price => 13.90, :description => "some description here"
puts "product create successful" << product2.name
product3 = Product.create! :name => "coca cola", :picture => "fsti9aopcqr7zw87hifj.jpg",
                           :product_type => 2, :price => 2.9, :description => "some description here"
puts "product create successful" << product3.name

ProductTypes.create([
                        {:name => 'pizza'},
                        {:name => 'drink'}
                    ])
