# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

## needehlp comment creer plusieurs users avec pour chaque des livres

3.times.each do |i| 
    User.create!(email: "user#{i}@example.org", password: "books123456", password_confirmation: "books123456")
end

User.all.find_each do |user| 
    10.times { |a|
        ## needhelp j'ai souvenir qu'on ai fait << mais je sais plus ou 
        ## SO ligne above is the same as : @user.books.push(Book.new())
        ## user.books = User.find(1).bookscolumn 
        user.books << Book.create!(title: Faker::Book.title, description: Faker::Movie.quote, isbn: "isbn_#{a}", user_id: user.id )
    }
end

