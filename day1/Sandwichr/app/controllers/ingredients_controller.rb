class IngredientsController < ApplicationController
	def index
		ingredients = Ingredient.all
		render json: ingredients
	end
	def create
		ingredient = Ingredient.create(ingredient_params)
		render json: ingredient#, status:201
	end
    def show
    	ingredient = Ingredient.find_by(id: params[:id])
    	#if sandwich.nil?
    	unless ingredient
    	   render json: {error: "ingredient not found"}, status: 404
    	#else
    	   #render
    	   return #el return es como un break aqui en este caso
        end
        render json: ingredient
    end
    def update
    	ingredient = Ingredient.find_by(id: params[:id])
    	#if sandwich.nil?
    	unless ingredient
    	   render json: {error: "ingredient not found"}, status: 404
    	#else
    	   #render
    	   return #el return es como un break aqui en este caso
        end
        ingredient.update(ingredient_params)
        render json: ingredient
    end
    def destroy
    	ingredient = Ingredient.find_by(id: params[:id])
    	#if sandwich.nil?
    	unless ingredient
    	   render json: {error: "ingredient not found"}, status: 404
    	#else
    	   #render
    	   return #el return es como un break aqui en este caso
        end
        ingredient.destroy
        render json: sandwich
    end





     private

        def ingredient_params
	       params.require(:ingredient)
	       .permit(:name, :calories)
        end
end
