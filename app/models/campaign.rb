class Campaign < ApplicationRecord
  has_many :contestants, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
