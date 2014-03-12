class CommentsController < ApplicationController

	# This controller only needs new and create because we don't want users to edit, delete or view a list of comments 

		def new
			# We need to find which story we're takling about
			# and we need to make a new comment on that story
			
			# We don't want the params[:id] because that is
			# talking about a comment NOT A STORY!
			
			# ADD THE PARENT THEN ADD THE CHILD
			
			# We can get the get the params[:story_id] from the URL though
			# Can do rake routes to see the URL structure, hence :story_id
			@story = Story.find(params[:story_id])
			
			# Make a new comment on that story
			@comment = @story.comments.new	
			
		end

		# Actually create the comment on the story
		def create
			@story = Story.find(params[:story_id])
			@comment = @story.comments.new(comment_params)
			
			# Just like with the story controller
			# if the comment is saved, show a message then redirect to the story we've been talking about else 
			# show the error page 
			if @comment.save
				flash[:success] = "Your comment has been posted"
				redirect_to story_path(@story)
			else
				render "new"
			end
			
			
			
		end



		# Lets make a shortcut for white listing our data 
		# ALWAYS DONE WHEN THERE IS A FORM ON THE CONTROLLER
		def comment_params
			# Params is always sent through with rails
			# make sure there's a comment in it 
			# and only allow the body field in case of hackers
			params.require(:comment).permit(:body)
		end


end
