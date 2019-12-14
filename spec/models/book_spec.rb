require 'rails_helper'

describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :publication_year}
    it { should validate_presence_of :pages}
  end
  describe 'relationships' do
    it { should have_many :book_authors }
    it { should have_many(:authors).through(:book_authors) }
  end
  describe 'model methods' do
    describe '#find_authors' do
      it "finds all author names for a given book" do
        tom = Author.create!(name: 'Tom Robbins')
        kurt = Author.create!(name: 'Kurt Vonnegut')
        jitter = Book.create!(title: 'Jitterbug Perfume', publication_year: '1985', pages: 325)

        tom.books << jitter
        kurt.books << jitter

        expect(jitter.find_authors).to eq(['Tom Robbins', 'Kurt Vonnegut'])
      end
    end
  end
end