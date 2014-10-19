class Post < ActiveRecord::Base
  belongs_to :user
	belongs_to :event

  validates :comment, length: { in: 1..130 }

	
end
