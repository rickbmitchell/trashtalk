class WelcomeController < ApplicationController

  def index
    @posts = Post.find(:all, :limit => 10, :order => 'created_at', :include => :username)
  end

end
