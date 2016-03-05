class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = set_post
    @comment = Comment.new
  end

  def edit
    @post = set_post
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
    puts params
    user = current_user
    if user.post.update(params[:post])
      redirect_to user_path, notice: "Post was updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post was deleted."
  end

  private

  def set_post
    Post.find(params[:id])
  end

  # def post_params
  #   params.require(:post).permit(:title, :message).merge(user: current_user)
  # end

end
