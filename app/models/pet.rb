class Pet < ApplicationRecord
  validates_presence_of :name, :age, :sex, :shelter
  belongs_to :shelter
end
