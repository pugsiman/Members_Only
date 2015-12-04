class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Your post was created!'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def logged_in_user
    return if logged_in?
    flash[:danger] = 'You are not authorized to do that, please log in.'
    redirect_to login_url
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
