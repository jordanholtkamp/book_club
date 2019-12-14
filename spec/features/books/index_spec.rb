require 'rails_helper'

describe 'As a user', type: :feature do
  describe 'When I go to books index' do
    before :each do
      @tom = Author.create!(name: 'Tom Robbins')
      @kurt = Author.create!(name: 'Kurt Vonnegut')
      @john = Author.create!(name: 'John Steinbeck')

      @jitter = Book.create!(title: 'Jitterbug Perfume', publication_year: '1985', pages: 325)
      @tom.books << @jitter
      @john.books << @jitter

      @slaughterhouse = Book.create!(title: 'Salughterhouse Five', publication_year: '1978', pages: 286)
      @kurt.books << @slaughterhouse
    end

    it "shows all the details for each book" do
      visit '/books'

      within "#book-#{@jitter.id}" do
        expect(page).to have_content(@jitter.title)
        expect(page).to have_content(@jitter.publication_year)
        expect(page).to have_content(@jitter.pages)
        expect(page).to have_content(@tom.name)
        expect(page).to have_content(@john.name)
      end

      within "#book-#{@slaughterhouse.id}" do
        expect(page).to have_content(@slaughterhouse.title)
        expect(page).to have_content(@slaughterhouse.publication_year)
        expect(page).to have_content(@slaughterhouse.pages)
        expect(page).to have_content(@kurt.name)
      end
    end

    it "each author name is a link to their show page" do
      visit '/books'

      within "#book-#{@jitter.id}" do
        expect(page).to have_link(@tom.name)
        expect(page).to have_link(@john.name)
        click_link "#{@tom.name}"
      end

      expect(current_path).to eq("/authors/#{@tom.id}")

      visit '/books'

      within "#book-#{@slaughterhouse.id}" do
        click_link "#{@kurt.name}"
      end

      expect(current_path).to eq("/authors/#{@kurt.id}")
    end
  end
end