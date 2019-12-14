require 'rails_helper'

describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :book_authors }
    it { should have_many(:books).through(:book_authors) }
  end

  describe 'model methods' do
    describe '#average_pages' do
      it "returns average pages per book for an author" do
        tom = Author.create!(name: 'Tom Robbins')
        jitter = Book.create!(title: 'Jitterbug Perfume', publication_year: '1985', pages: 325)
        skinny_legs = Book.create!(title: 'Skinny Legs and All', publication_year: '1991', pages: 472)
        tom.books << jitter
        tom.books << skinny_legs

        expect(tom.average_pages).to eq(398)
      end
    end
  end
end