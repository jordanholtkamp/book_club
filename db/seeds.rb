# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tom = Author.create!(name: 'Tom Robbins')
kurt = Author.create!(name: 'Kurt Vonnegut')
john = Author.create!(name: 'John Steinbeck')

jitter = Book.create!(title: 'Jitterbug Perfume', publication_year: '1985', pages: 325)
tom.books << jitter
john.books << jitter

slaughterhouse = Book.create!(title: 'Salughterhouse Five', publication_year: '1978', pages: 286)
kurt.books << slaughterhouse