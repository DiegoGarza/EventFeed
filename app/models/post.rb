class Post < ActiveRecord::Base
	belongs_to :user

  validates :comment, length: { in: 4..130 }

	
end
