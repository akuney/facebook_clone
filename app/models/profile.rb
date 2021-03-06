class Profile < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :birth_month, :birth_day,
  :birth_year, :gender, :job, :employer, :current_city, :home_city,
  :relationship_status, :interested_in, :about_me, :photo_url, :owner_id

  include PgSearch
  multisearchable :against => [:first_name, :last_name]

  belongs_to :owner, class_name: :user

end
