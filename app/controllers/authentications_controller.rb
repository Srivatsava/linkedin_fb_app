class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
   auth=request.env["omniauth.auth"]
   if auth["provider"] =="linkedin"
        #user=User.find_by_linkedinuid(auth["uid"]) || User.create_linkedin_details(auth)
        #user=User.create_linkedin_details(auth)
        user=User.find_by_linkedinuid(auth["uid"]) || User.new(:linkedinuid => auth["uid"],:first_name =>auth["info"]["first_name"],:last_name => auth["info"]["last_name"],:email => auth["info"]["email"],:linkedinImg => auth["info"]["image"])
	user.save
	#User.delete(user)
        #user=User.new()
   	#render :text => user.linkedinImg
	session[:user_id] = auth["uid"]
	redirect_to root_url
   else
   	user=User.find_by_linkedinuid(session[:user_id])
	user.fbuid = auth["uid"]
	user.location = auth["info"]["location"]
	user.fbImg = auth["info"]["image"]
	user.first_name ||= auth["info"]["first_name"]
	user.last_name ||= auth["info"]["last_name"]
	user.email ||= auth["info"]["email"]
	user.save
	session[:fbuser_id] = auth["uid"]	
	redirect_to root_url
   end
   #render :text => auth['extra'].to_yaml
  end

  def destroy
  	session[:user_id] = nil
	session[:fbuser_id] = nil
	redirect_to root_url
  end
end
