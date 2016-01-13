class StaticPagesController < ApplicationController
  def index
  	render text: "Hello, this is an explicit call to controller action."
  	return 
  end 

  def home
  end

  def help
  end

  def about
  end 
end
