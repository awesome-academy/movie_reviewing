class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  before_save {self.email = email.downcase}
  has_many :post_reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :films, through: :ratings
  has_many :likes
  mount_uploader :avatar, PictureUploader
  validates :name,  presence: true, length: {maximum: Settings.user.name_maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.email_maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.password_minimum}, allow_blank: true
  scope :desc_create_time, ->{order(created_at: :desc)}
  has_secure_password
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attributes(reset_digest: User.digest(reset_token))
    update_attributes(reset_sent_at: Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def remember
    self.remember_token = User.new_token
    update_attributes(remember_digest: User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attributes(remember_digest: nil)
  end

  def activate
    update_attributes(activated: true)
    update_attributes(activated_at: Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self)
  end

  def password_reset_expired?
    reset_sent_at < Settings.expire_hours.hours.ago
  end

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.avatar = auth.info.image
      user.name = auth.info.name
      user.oauth_exprires_at = Time.at(auth.credentials.expires_at)
      user.activated = true
      user.password_digest = auth.credentials.token
      user.activation_digest = auth.credentials.token
      user.activated_at = Time.now
    end
  end

  def self.new_users
    where("created_at > ?", Time.new.beginning_of_day)
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
