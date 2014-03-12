class VotesController < ApplicationController


	# I only need a create method as I don't need a form to fill in.
	# Either I vote or I don't

	def create
		# Find the story we want to vote on 
		@story = Story.find(params[:story_id])
		
		# Make a new vote on the story with the users IP address
		@vote = @story.votes.new(ip_address: request.ip) 
		
		# Save the vote if we haven't voted
		if @vote.save 
		# Let the user know
			flash[:success] = "You upvoted this story"
			
		else
			flash[:error] = "You can't vote twice"
		end
		
		# go back to the story page for the story we've just been talking about
		redirect_to story_path(@story)
		
	end

end
