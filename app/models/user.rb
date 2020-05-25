class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :books,dependent: :destroy
  validates :introduction, presence: true, length: {maximum: 50}
  validates :name, presence: true

  attachment :profile_image
end
