class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true, allow_nil: false
  validates_presence_of :ingredient, allow_nil: false
  validates_presence_of :cocktail, allow_nil: false
  validates :cocktail, uniqueness: { scope: :ingredient }
end
