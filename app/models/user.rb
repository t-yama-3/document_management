class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :documents, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :markings, dependent: :destroy
  has_many :sections
  has_many :user_sections, dependent: :destroy
  has_many :participate_sections, through: :user_sections, source: :section
  has_one :profile, dependent: :destroy
  has_many :friends
  has_many :messages

  validates :nickname, presence: true, length: { maximum: 50 }
end
