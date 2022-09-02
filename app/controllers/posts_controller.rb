# frozen_string_literal: true

# post controller

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

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
      redirect_to @post
    else
      render :new
    end
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
