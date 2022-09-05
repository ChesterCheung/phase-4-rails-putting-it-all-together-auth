class RecipesController < ApplicationController
    before_action :authorize, only: [:index, :create]
 rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        recipe = Recipe.all
        render json: recipe, status: :created
    end

    def create
        user = User.find_by(id: session[:user_id])
        recipe = user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

    def authorize
        render json: {errors:[ "Not authorized"]}, status: :unauthorized unless session.include? :user_id
    end

    def record_invalid(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    
    end

end
