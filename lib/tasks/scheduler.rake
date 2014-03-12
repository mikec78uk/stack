# This is a tsk for grabbing code from reddit

task scrape_reddit: :environment do
	
	puts "hiya! I'm about to scrape reddit"
	
	# get the raw html from reddit	
	@raw_html = HTTParty.get("http://www.reddit.com")
	
	# lets turn the raw html into real HTML we can parse
	@real_html = Nokogiri::HTML(@raw_html)
	
	# in css we would style up the title links using div#siteTable a.title
	# Use the css selector to get the relvant bits of the page

	@real_html.css("div#siteTable a.title").each do |link|
	
		# This is similar to the stories#index.html.erb view
		@story = Story.new
		@story.title = link.text
		@story.link = link[:href]
		@story.save
	
	end	
	
end