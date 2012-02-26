class User < ActiveRecord::Base
	has_many :authentications
        def create_linkedin_details(auth)
		User.new(:first_name =>auth["info"]["first_name"],
			:last_name => auth["info"]["last_name"],
			:email => auth["info"]["email"],
			:location => auth["info"]["location"],
			:linkedinImg => auth["info"]["image"],
			:linkedinuid => auth["uid"])
	end
end
