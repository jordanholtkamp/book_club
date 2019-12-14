class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :publication_year
  validates_presence_of :pages

  has_many :book_authors
  has_many :authors, through: :book_authors
end
