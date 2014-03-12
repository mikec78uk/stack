class AddVotesCountToStory < ActiveRecord::Migration
  def change
  	# Add_column <table (plural)>, <colum name>, <info type>, default: <default value, if applicable>
  	add_column :stories, :votes_count, :integer
  	add_column :stories, :is_featured, :boolean, default: false
  end
end
