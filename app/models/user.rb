class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy, foreign_key: 'owner_id'
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :events
  has_many :bookings
end
