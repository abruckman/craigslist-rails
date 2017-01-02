class PostsController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.create(post_params)
    @post.secret_key = rand(1000..9999)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end

  end

  def show
    @post = Post.find(params[:post_id])
    @category = @post.category
  end

  def index
    @category = Category.find(params[:category_id])
    redirect_to @category
  end

  private
    def post_params
      params.require(:post).permit(:title, :price, :email, :body, :location)
    end

end
