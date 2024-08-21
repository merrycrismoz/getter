class Card < ApplicationRecord
  belongs_to :deck
  validates :title, presence: true

end
