class SandwichViewsController < ApplicationController
    def index
        @sandwiches = Sandwich.all
    end

    def show
        @sandwich = Sandwich.find(params[:id])
        @ingredients = @sandwich.ingredients
        @possible_ingredients = Ingredient.all
    end
end
