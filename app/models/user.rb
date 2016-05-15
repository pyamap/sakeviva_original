class User < ActiveRecord::Base
	attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
  	uniqueness: {case_sensitive: :false},
  	length: {minimum: 4, maximum: 20},
  	format: { with: /\A[a-z0-9]+\z/, message: "ユーザー名は半角英数字です"}
end
