# frozen_string_literal: true

module Api
  # controller of the category
  class CategoriesController < Api::BaseController
    def index
      categories = Category.all
      render json: categories, each_serializer: CategorySerializer
    end

    def show
      id = params[:id]
      category = Category.find(id)
      render json: category, serializer: CategorySerializer
    end
  end
end
