class Vote < ActiveRecord::Base

	# Lets the vote know that it belongs to a story
	# AND let the story keep track of how many votes it has
	
	# Counter_cache lets the story keep track of how many votes it has
	belongs_to :story, counter_cache: true
	
	
	# Check the ip address is unique for that story, i.e. one ip address per story id
	validates :ip_address, uniqueness: {scope: :story_id}
	
	# If we just had uniqueness: true that would mean one vote across the whole site per ip-adress; this way it's
	# one vote per story for an ip-address

end
