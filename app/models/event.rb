class Event < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  belongs_to :user
  has_many :posts

end
