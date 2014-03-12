class Comment < ActiveRecord::Base

	# Lets the comment know that it belongs to a story
	belongs_to :story
	
	# make sure the comment isn't blank
	validates :body, presence: true
	
end
