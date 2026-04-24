class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 5 }
end

