# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'


5.times do
  Wiki.create!(
    title: "Chuck Norris Facts",
    body: Faker::ChuckNorris.fact
    )
  end

1.times do 
  User.create!(
    email: Faker::Internet.email,
    password: "helloworld",
    role: 'admin'
    )
  end
    
    
    
    
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"