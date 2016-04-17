class User < ActiveRecord::Base
  has_many :experiences, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :sns, dependent: :destroy

  has_secure_password

  validates :password, length: { minimum: 4 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 40 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end
