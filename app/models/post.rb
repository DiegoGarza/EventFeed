class Post < ActiveRecord::Base
  belongs_to :user
	belongs_to :event

  validates :comment, length: { in: 4..130 }

	
end
