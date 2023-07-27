class Label < ApplicationRecord
  has_many :issues, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
