class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	attachment :image

	has_many :members, dependent: :destroy
	has_many :teams, through: :members
	has_many :posts, dependent: :destroy

	has_many :user_points, dependent: :destroy

end
