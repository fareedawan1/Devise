class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end
 
  def edit
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
 
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.' 
    else
      render :new 
    end
  end
 
  def update
    authorize @post
    if @post.update_attributes(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit 
    end
  end
 
  def destroy
    authorize @post
    @post.destroy
    redirect_to root_path, notice: 'Post was successfully destroyed.'
  end
 
  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body,:user_id)
    end
end