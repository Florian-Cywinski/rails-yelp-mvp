# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

restaurants = [{ name: 'Trattoria Lugana', address: 'Goerzallee 119, 12207 Berlin', category: 'italian' },
               { name: 'Hee Lam Mun', address: 'Grunewaldstraße 23, 12165 Berlin', category: 'chinese' },
               { name: 'Sakura', address: 'Clayallee 352, 14169 Berlin', category: 'japanese' },
               { name: 'Restaurant Patrice', address: 'Mainzer Str. 17, 10715 Berlin', category: 'french' },
               { name: 'De Maufel Restaurant', address: 'Leonhardtstraße 13, 14057 Berlin', category: 'belgian' }]

restaurants.each do |restaurant_hash|
  Restaurant.create!(restaurant_hash)
end
