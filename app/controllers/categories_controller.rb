class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
  end
  
  def edit
    @category = Category.find(params[:id])
    @title = "Edit Category"
    
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path, :flash => { :success => "Category updated." }
    else
      @title = "Edit Category"
      render 'edit'
    end
  end
  
  def new
    @title = "New Category"
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path
    else
      @title = "New Category"
      render 'new'
    end
  end
  
  def index
    @categories = Category.all
  end

end
