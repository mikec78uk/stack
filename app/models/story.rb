class Story < ActiveRecord::Base

	# Lets make the code know that there's a relationship between story and comment
	
	has_many :comments
	# Another relationship between story and votes
	has_many :votes

	# Let's make sure the data in database is exactly what we want it to be

	validates :title, presence: true, length: { minimum: 5, message: "Must be over 5 characters long" }
	validates :link, presence: true, uniqueness: true
	
	# UNDER THE HOOD:
	# validates ()
	# :title is a symbol as it doesn't change within the code
	# {presence: true} is a hash

	# validates(:title, {presence: true}) - it's written without the brackets



end
