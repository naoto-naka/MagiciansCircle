class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    category.save
    redirect_to new_admin_category_path
  end

private
  def category_params
    params.require(:category).permit(:category_name)
  end
end
