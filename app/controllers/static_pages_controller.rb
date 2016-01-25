class StaticPagesController < ApplicationController
  def index
  	render text: "Hello, this is an explicit call to controller action."
  	return 
  end 

  def home
    @micropost = current_user.microposts.build if logged_in?
  end

  def help
  end

  def about
  end 
  
  def contact
  end
end
