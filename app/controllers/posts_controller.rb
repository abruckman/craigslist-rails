class PostsController < ApplicationController

  def new
  end

  def create
    @category = Category.find(params[:article_id])
  end

end
