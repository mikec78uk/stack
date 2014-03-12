Stack::Application.routes.draw do

	# URLS for Active Admin; added by gem itself
	  devise_for :admin_users, ActiveAdmin::Devise.config
	  ActiveAdmin.routes(self)
  
	# I want to set up all of the URL's for the stories controller
	# This is a shortcut for adding SEVEN different actions

	# REST is a way to alter and view data, the 7 actions are...
	# index, show, new, create, edit, update, destroy

	resources :stories do
		# inside stories we have a nested resource, otherwise just resources :stories
		# this is a relationship between stories (parent) and comments (child)
		# This could go down a level, i.e comments could have a child so would have its own do and end
		# e.g. resources :comments do
		#				resources :votes
		#		end
		
		resources :comments
		
		# Inside the stories we have another nested resource
		# which is a relationship between stories and votes
		resources :votes
		
	
	end

	# SHORTCUT LINKS: 
	# new_story_path	=> stories#new
	# edit_story_path	=> stories#edit
	# story_path		=> stories#show
	# stories_path		=> stories#index

	# FOR NESTED URL's
	# new_story_comments_path	=> comments#new
	# edit_story_comment_path	=> comments#edit
	# story_comment_path	 	=> comments#show
	# story_comments_path	 	=> comments#index

	# To see all of the URL's across the site:
	# Cancel out of the rails server and we can type in "rake routes"

  # Set up homepage to go to stroies controller
  # and show the index page

  root "stories#index"

end
