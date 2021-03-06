class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :oauth_applications, class_name: 'Doorkeeper::Application', foreign_key: :uid
  has_many :apps, foreign_key: :uid, dependent: :destroy
end
