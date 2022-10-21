class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, length: {minimum:4, maximum:17}
  has_many :documents, dependent: :destroy
  has_many :taskers, dependent: :destroy
end
