class User < ApplicationRecord
  belongs_to :project, optional: true
  has_many :issues, through: :project

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  def current_project
    project
  end
end
