# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Category.create(name: 'Archéologie')
Category.create(name: 'Architecture')
Category.create(name: 'Art')
Category.create(name: 'Arts et Costumes')
Category.create(name: 'Géographie')
Category.create(name: 'Géometrie')
Category.create(name: 'Illustration / BD')
Category.create(name: 'Littérature')
Category.create(name: 'Voyages')

Sitecontent.create(title_site: 'Titre', subtitle_site: 'Sous titre', description_site: 'Description',
                   text_rc: 'Texte colonne de droite')

3.times.each do |i|
  if i == 1
    User.create!(email: 'a@a.org', firstname: Faker::Name.first_name, lastname: Faker::Name.last_name,
                 password: 'asdzxc', password_confirmation: 'asdzxc', role: 2)
  else
    User.create!(email: "user#{i}@a.org", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name,
                 password: 'asdzxc', password_confirmation: 'asdzxc')
  end
end

User.all.find_each do |user|
  rand(1..30).times do |a|
    ## needhelp j'ai souvenir qu'on ai fait << mais je sais plus ou
    ## SO ligne above is the same as : @user.books.push(Book.new())
    ## user.books = User.find(1).bookscolumn
    user.books << Book.create!(title: Faker::Book.title, description: Faker::Movie.quote, isbn: "isbn_#{a}",
                               user_id: user.id, category_id: rand(1..9), price: rand(50..1400).round(-1))
  end
end
