class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = get_post
    @comment = Comment.new
  end

  def edit
    @post = get_post
  end

  def create
    # puts params
    # @post = Post.new(post_params)
    current_user
    @post = Post.create(user_id: current_user.id, title: params[:title], message: params[:message])
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem"
      redirect_to 'posts/new'
    end
  end

  def update
    @post = get_post
    @post.update(id: @post.id, title: params[:title], message: params[:message])
      redirect_to root_path, notice: "Post was updated."
    # else
    #   render :edit
    # end
  end

  def destroy
    @user = current_user
    @post = get_post
    @post.destroy
    redirect_to user_path(@user), notice: "Post was deleted."
  end

  private

  # def set_post
  #   current_user.posts.where(id: params[:id]).first
  # end

  # def post_params
  #   params.require(:post).permit(:title, :message)
  # end

end
