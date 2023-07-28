class User < ApplicationRecord
  belongs_to :project

  has_many :issues, through: :project

  def current_project
    project
  end
end
