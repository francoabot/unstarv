class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #include SessionsHelper
 
  rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
end
 
def redirect_back_or(path)
  redirect_to request.referer || path
end
  
   # Confirms a logged-in user.
   # def logged_in_user
     # unless logged_in?
     #   store_location
      #  flash[:danger] = "Please log in."
      #  redirect_to login_url
      #end
    #end



     def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end


    def current_user?(user)
    user == current_user
    end
    
   
end
