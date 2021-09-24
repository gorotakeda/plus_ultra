class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :search_product, only: [:index, :search, :show]


  def index
    @posts = Post.includes(:user).order('created_at DESC')
    set_post_column
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
    set_post_column
    @review = Review.new
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

  def search
    @results = @p.result
  end

  private

  def post_params
    params.require(:post).permit(:title, :workout, :meal, :sex_id, :age_id, :style_id, :purpose_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def search_product
    @p = Post.ransack(params[:q]) 
  end

  def set_post_column
    @post_sex = Post.select("sex_id").distinct
    @post_style = Post.select("style_id").distinct
    @post_purpose = Post.select("purpose_id").distinct
    @post_age = Post.select("age_id").distinct
  end

end
