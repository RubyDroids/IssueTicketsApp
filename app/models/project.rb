class Project < ApplicationRecord
  belongs_to :admin

  has_many :users, dependent: :nullify
  has_many :issues, dependent: :destroy
end
