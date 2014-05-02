class WelcomeController < ApplicationController
  def index
  	@post=Post.where.not("owner" => current_user) 
  end
end
