class User < ApplicationRecord
  belongs_to :project

  has_many :issues, through: :project

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable

  def current_project
    project
  end
end
