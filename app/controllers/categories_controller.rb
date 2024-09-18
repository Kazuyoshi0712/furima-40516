class CategoriesController < ApplicationController
  def show
    @categories = Category.find(params[:id])

    @items = @category.items
  end
end
