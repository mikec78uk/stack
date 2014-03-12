class StoriesController < ApplicationController

	# To add a page to my site
	# add an index page (aka the homepage)

	def index
		# in here lives all the code for the index page

		@username = "Mike"

		# To make a list / array use square brackets
		# @stories = ["Google", "Facebook", "Twitter", "Linked In", "Reddit"]

		# now we want to get data from database
		
		# Order by most voted, if same then latest first
		# @stories = Story.order("votes_count desc, created_at desc")
		
		# render "stories"
		
		
		# If the URL has extra parameters, namely sort = recent then order by 
		# order by created_at desc
		# if the filter=featured, just get the is_featured true stories
		# else just do the usual stuff
		
		
		# params means something in the url, e.g. sort
		if params[:sort] == 'recent'
			# == is compare whereas = is assignment
			# sort by most recent
			
			# could include where, for example Story.where(is_featured: true).order etc....
			@stories = Story.order("created_at desc")
			
			
		elsif params[:filter] == 'featured'
		
			@stories = Story.where(is_featured: true).order("title asc")
			
		else
			# sort by most voted
			@stories = Story.order("votes_count desc, created_at desc")
		end
		
		
	end

	# Show me an individual story page
	def show
		# I want to get one individual story
		# params :id is from URL, e.g. if /stories/7
		# then params :id is 7
		@story = Story.find(params[:id])
		 
	end


	# This is going to be the "Adding a new story form"
	def new
		# Make @story be a blank story, ready to be filled in
		# Just the form on the front page, create is doing something in the db
		@story = Story.new
		
	end


	# new and create work as a pair
	# the create action actually adds things to the database

	def create
		#make @story be a blank story but with fields filled in
		@story = Story.new(story_params)
	
		# Actually save to db IF validations pass
		# If they don't pass, show the form with errors
			if @story.save
				# Let user know its successful
				flash[:success] = "Yay, you've submitted the story " + @story.title
				# lets make it go back to the homepage
				redirect_to root_path
				
			else
				# if the story DOESN'T save do this
				# Show the new.html.erb form with errors
				# render shows the new page (retains the values and shows the error/s)
				render "new"
			end	
			
	end

	
	# I want to show the edit form for an individual story

	def edit
		# find the story based on the URL
		@story = Story.find(params[:id])

	end

	# I want to update the database with the updated data
	def update
		# Find the story (same code as edit)
		@story = Story.find(params[:id])
		
			# Update the record with the form data IF it validates
			if @story.update(story_params)
				# Let user know its successful
				flash[:success] = "You've updated the story"
				# Go to story page (show)
				redirect_to story_path(@story)
			else
				# Same principle as def create (if it doesn't update, show edit form with errors)
				render "edit"
			end

	end

	# Lets destroy the destory
	def destroy
		# Find the story 
		@story = Story.find(params[:id])
		# Destroy it
		@story.destroy
		
		# Let user know its successful
		flash[:success] = "You've deleted the the story"

		# Go to Homepage
		redirect_to root_path

	end





	# I want to get the right data from the form (white listed data)

	def story_params
		# Only get the title, desc and link from the story params
		params.require(:story).permit(:title, :description, :link)
	end







end
