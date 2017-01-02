class CategoriesController < ApplicationController
  def new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def index
    @articles = Article.all
  end

end
