class User < ActiveRecord::Base
	#attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable #オンにするとfacebookログインでsign_upにリダイレクトし続けるからダメ。

  validates :name,
  	uniqueness: {case_sensitive: :false},
  	length: {minimum: 4, maximum: 20}
  	#format: { with: /\A[a-z0-9]+\z/, message: "ユーザー名は半角英数字です"}

  	has_many :addresses, dependent: :destroy
    has_many :orders, dependent: :destroy
    accepts_nested_attributes_for :addresses, allow_destroy: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = "http://graph.facebook.com/#{auth.uid}/picture?type=large" # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

end
