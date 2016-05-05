class IngredientsController < ApplicationController

    def index
        ingredients = Ingredient.all
        if ingredients.length < 1
            render json: {error: "no ingredients in databse"}, status: 404
    end
    def create
        ingredient = Ingredient.create(ingredient_params)
        render json: ingredient, status: 201
    end

    def destroy
        ingredient = load_ingredient(params[:id])

        ingredient.destroy

        render json: ingredient, status: 201

    end

    def show
        ingredient = load_ingredient(params[:id])
        if ingredient.nil?
            return
        end
        render json: ingredient, status: 201
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name, :calories)
    end

    def load_ingredient(id)
        ingredient = Ingredient.find_by(id: id)
        if ingredient.nil?
            render json: {error: "ingredient not found"}, status: 404
            return
        end
        return ingredient
    end
end