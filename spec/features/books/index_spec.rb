require 'rails_helper'

describe 'As a user', type: :feature do
  describe 'When I go to books index' do
    it "shows all the details for each book" do
      tom = Author.create!(name: 'Tom Robbins')
      kurt = Author.create!(name: 'Kurt Vonnegut')
      john = Author.create!(name: 'John Steinbeck')

      jitter = Book.create!(title: 'Jitterbug Perfume', publication_year: '1985', pages: 325)
      tom.books << jitter
      john.books << jitter

      slaughterhouse = Book.create!(title: 'Salughterhouse Five', publication_year: '1978', pages: 286)
      kurt.books << slaughterhouse

      visit '/books'

      within "#book-#{jitter.id}" do
        expect(page).to have_content(jitter.title)
        expect(page).to have_content(jitter.publication_year)
        expect(page).to have_content(jitter.pages)
        expect(page).to have_content(tom.name)
        expect(page).to have_content(john.name)
      end

      within "#book-#{slaughterhouse.id}" do
        expect(page).to have_content(slaughterhouse.title)
        expect(page).to have_content(slaughterhouse.publication_year)
        expect(page).to have_content(slaughterhouse.pages)
        expect(page).to have_content(kurt.name)
      end
    end
  end
end



# As a user,
# When I visit '/books'
# Then I see each book in the system including the book's:
#   - title
#   - number of pages
#   - publication year
#   - the name of each author that wrote the book