require 'rails_helper'

describe 'As a user' do
  describe 'When I visit the author show page' do
    it "shows all the details of the author" do
      tom = Author.create!(name: 'Tom Robbins')
      jitter = Book.create!(title: 'Jitterbug Perfume', publication_year: '1985', pages: 325)
      skinny_legs = Book.create!(title: 'Skinny Legs and All', publication_year: '1991', pages: 472)
      tom.books << jitter
      tom.books << skinny_legs

      visit "/authors/#{tom.id}"

      expect(page).to have_content(tom.name)
      expect(page).to have_content(jitter.title)
      expect(page).to have_content(skinny_legs.title)
      expect(page).to have_content(398)
    end
  end
end