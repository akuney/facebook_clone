class User < ActiveRecord::Base
  include PgSearch


  attr_accessible :email, :password
  attr_reader :password

  validates :password_digest, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  before_validation :ensure_session_token

  has_one :profile, foreign_key: :owner_id

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  # got this from a RailsCast

  has_many :pending_friendships
  has_many :pending_friends, :through => :pending_friendships
  has_many :inverse_pending_friendships,
  :class_name => "PendingFriendship", :foreign_key => "pending_friend_id"
  has_many :inverse_pending_friends, :through => :inverse_pending_friendships,
  :source => :user

  has_many :statuses, foreign_key: "author_id"
  has_many :authored_comments, class_name: "Comment", foreign_key: "author_id"
  has_many :received_comments, class_name: "Comment", foreign_key: "recipient_id"
  has_many :replies, foreign_key: "author_id"

  has_many :likes, foreign_key: "liker_id"
  has_many :statuses_liked, through: :likes, source: :post, source_type: "Status"
  has_many :comments_liked, through: :likes, source: :post, source_type: "Comment"
  has_many :replies_liked, through: :likes, source: :post, source_type: "Reply"
  has_many :photo_comments_liked, through: :likes, source: :post, source_type: "PhotoComment"

  has_many :user_message_threads, foreign_key: "recipient_id"
  has_many :message_threads, through: :user_message_threads,
  source: :message_thread
  has_many :message_threads_created, class_name: "MessageThread",
  foreign_key: :creator_id
  has_many :authored_messages, foreign_key: "author_id"

  has_many :photos_uploaded, class_name: "Photo", foreign_key: "uploader_id"
  has_many :photo_taggings
  has_many :photos_tagged_in, through: :photo_taggings, source: :photo

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



  def all_friends
    self.friends + self.inverse_friends
  end

  def all_pending_friends
    self.pending_friends + self.inverse_pending_friends
  end

  def all_friendships
    self.friendships + self.inverse_friendships
  end

  def all_message_threads
    self.message_threads + self.message_threads_created
  end

  def friendship_with(user)
    friendship = Friendship.where(user_id: self.id, friend_id: user.id) +
     Friendship.where(user_id: user.id, friend_id: self.id)

    return friendship.first
  end

  def pending_friendship_with(user)
    pending_friendship = PendingFriendship.where(user_id: self.id,
    pending_friend_id: user.id) +
    PendingFriendship.where(user_id: user.id,
    pending_friend_id: self.id)

    return pending_friendship.first
  end

  def photo
    return "<img src= #{self.profile.photo_url} width='80' height='80'></img>".html_safe
  end



  # notifications

  def recent_accepted_requests
    self.friendships.where(created_at: (Time.now - 604800)..(Time.now))
  end

  def recent_tagged_photos
    self.photos_tagged_in.where(created_at: (Time.now - 604800)..(Time.now))
  end

  def recent_received_comments
    self.received_comments.where(created_at: (Time.now - 604800)..(Time.now))
  end

  def recent_uploaded_photo_activities
    activities = []

    self.photos_uploaded.each do |uploaded_photo|
      activities += uploaded_photo.recent_activities unless uploaded_photo.recent_activities.empty?
    end

    activities
  end

  def recent_tagged_photo_activities
    activities = []

    self.photos_tagged_in.each do |tagged_photo|
      unless tagged_photo.recent_activities.empty?
        activities += tagged_photo.recent_activities
      end
    end

    activities
  end

  def recent_post_activities
    activities = []
    posts = self.statuses + self.authored_comments + self.received_comments

    posts.each do |post|
      activities += post.recent_activities unless post.recent_activities.empty?
    end

    activities
  end

  def recent_activities
    activities = self.recent_accepted_requests + self.recent_tagged_photos +
    self.recent_received_comments + self.recent_uploaded_photo_activities +
    self.recent_tagged_photo_activities + self.recent_post_activities

    return activities.sort{|act1, act2| act2.created_at <=> act1.created_at}
  end



  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end


end
