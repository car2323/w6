class SandwichesController < ApplicationController
	def index
		sandwiches = Sandwich.all
		render json: sandwiches
	end
	def create
		sandwich = Sandwich.create(sandwich_params)
		render json: sandwich#, status:201
	end
    def show
    	sandwich = Sandwich.find_by(id: params[:id])
    	sandwich_ingredient = sandwich.ingredient
    	#if sandwich.nil?
    	unless sandwich
    	   render json: {error: "sandwich not found"}, status: 404
    	#else
    	   #render
    	   return #el return es como un break aqui en este caso
        end
        render json: { sandwich: sandwich, ingredients: sandwich_ingredient }
    end
    def add_ingredient
    	sandwich = Sandwich.find_by(id: params[:id])
    	ingredient = Ingredient.find_by(id: params[:ingredient_id])
    	sandwich.ingredients.push(ingredient)
    	if sandwich.nil? || ingredient.nil? 	
    	   render json: {error: "sandwich or ingredient not found"}, status: 404
    	   #render
    	   return #el return es como un break aqui en este caso
        end
        render json: { sandwich: sandwich, ingredients: ingredient }
    end
    def update
    	sandwich = Sandwich.find_by(id: params[:id])
    	#if sandwich.nil?
    	unless sandwich
    	   render json: {error: "sandwich not found"}, status: 404
    	#else
    	   #render
    	   return #el return es como un break aqui en este caso
        end
        sandwich.update(sandwich_params)
        render json: sandwich
    end
    def destroy
    	sandwich = Sandwich.find_by(id: params[:id])
    	#if sandwich.nil?
    	unless sandwich
    	   render json: {error: "sandwich not found"}, status: 404
    	#else
    	   #render
    	   return #el return es como un break aqui en este caso
        end
        sandwich.destroy
        render json: sandwich
    end





     private

        def sandwich_params
	       params.require(:sandwich)
	       .permit(:name, :bread_type)
        end
end
