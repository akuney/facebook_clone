class Photo < ActiveRecord::Base
  attr_accessible :url, :uploader_id, :tagged_user_ids

  # validates_uniqueness_of :url, scope: [:uploader_id]
  #(doesn't go well with demo user)

  belongs_to :uploader, class_name: "User"
  has_many :photo_taggings, dependent: :destroy
  has_many :tagged_users, through: :photo_taggings, source: :user
  has_one :photo_comment, dependent: :destroy

  def untagged_friends(user)
    untagged_friends = []

    user.all_friends.each do |friend|
      unless self.tagged_users.include?(friend)
        untagged_friends << friend
      end
    end

    untagged_friends
  end

  def recent_activities
    if self.photo_comment
      replies = self.photo_comment.replies.where(created_at: (Time.now - 604800)..(Time.now))
      likes = self.photo_comment.likes.where(created_at: (Time.now - 604800)..(Time.now))
      return replies + likes
    else
      return []
    end
  end
end
