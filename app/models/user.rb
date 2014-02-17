class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password

  validates :password_digest, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  before_validation :ensure_session_token

  has_one :profile, foreign_key: :owner_id

  has_many :friendships
  has_many :second_friends, through: :friendships, source: :second_friend
  has_many :first_friends, through: :friendships, source: :first_friend

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user.try(:is_password?, password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def name
    self.profile.first_name + " " + self.profile.last_name
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end


end
