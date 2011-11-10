class CategoriesController < ApplicationController
  def new
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @title = "New Category"
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to @category
    else
      @title = "New Category"
      render 'new'
    end
  end

end
