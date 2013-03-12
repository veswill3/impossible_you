class User < ActiveRecord::Base
  attr_accessible :first, :last, :email, :password, :password_confirmation
  has_secure_password

  before_save { self.email.downcase! }
  before_save :create_remember_token

  validates :first, presence: true, length: { maximum: 50 }
  validates :last,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  def name
  	"#{first} #{last}"
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end