class PostsController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.create(post_params)
    @post.secret_key = rand(1000..9999)

    p @post

    if @post.save
      flash.notice = "your secret key is #{@post.secret_key} . You will need this number to edit or delete the post"
      redirect_to category_post_path(@category, @post)
    else
      render 'new'
    end

  end

  def show
    p flash.notice
    @post = Post.find(params[:id])
    @category = @post.category
  end

  def index
    @category = Category.find(params[:category_id])
    redirect_to @category
  end

  def edit
    @post = Post.find(params[:id])
    @category = @post.category
  end

  def update
    @post = Post.find(params[:id])
    @category = @post.category

    if @post.secret_key == post_params[:secret_key] && @post.update(post_params)
      redirect_to category_post_path(@category, @post)
    else
      render 'edit'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :price, :email, :body, :location, :secret_key)
    end

end
