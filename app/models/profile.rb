class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :birth_month, :birth_day,
  :birth_year, :gender, :job, :employer, :current_city, :home_city,
  :relationship_status, :interested_in, :about_me, :photo_url, :owner_id

  belongs_to :owner

  validates :first_name, :last_name, :photo_url, presence: true
end
