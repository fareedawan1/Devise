class PostPolicy
  attr_reader :user, :post
  
  def initialize(user, post)
    @user = user
    @post = post
  end
  
  def update?
    user.present?
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

end