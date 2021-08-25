class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    if @post.user_id = current_user.id
      @post.destroy
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :workout, :meal, :sex_id, :age_id, :style_id, :purpose_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
