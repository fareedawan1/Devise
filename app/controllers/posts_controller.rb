class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    authorize @posts
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end
 
  def edit
  end

  def create
    @post = Post.new(post_params)
    # @post.user = current_user
    authorize @post
 
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.' 
        # render @post
      else
        render :new 
      end
  end
 
  def update
    respond_to do |format|
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
        render :show, status: :ok, location: @post
      else
        render :edit 
        render json: @post.errors, status: :unprocessable_entity 
      end
    end
  end
 
  def destroy
    @post.destroy
    respond_to do |format|
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
      head :no_content
    end
  end
 
  private
    def set_post
      @post = Post.find(params[:id])
      authorize @post
    end

    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end