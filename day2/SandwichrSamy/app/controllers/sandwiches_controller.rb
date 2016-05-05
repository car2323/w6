class SandwichesController < ApplicationController

    def add_ingredient
        sandwich = load_sandwich(params[:id])
        if sandwich.nil?
            return
        end
        ingredient = Ingredient.find(params[:ingredient_id])
        if ingredient.nil?
            render json: {error: "ingredient not found"}, status: 404
            return
        end

        unless sandwich.ingredients.include? ingredient #is this correct?
            new_calories = sandwich.total_calories + ingredient.calories
            sandwich.update(total_calories: new_calories)
            sandwich.ingredients.push ingredient
        end
        render json: sandwich.to_json(include: :ingredients), status: 201


    end

    def index
        sandwiches = Sandwich.all
        if sandwiches.length < 1
            render json: {error: "no sandwiches in database"}, status: 404
            return
        end
        render json: sandwiches, status: 201
    end

    def create
        sandwich = Sandwich.create(sandwich_params)
        render json: sandwich.to_json(include: :ingredients), status: 201
    end

    def show
        sandwich = load_sandwich(params[:id])
        if sandwich.nil?
            return
        end

        render json: sandwich.to_json(include: :ingredients), status: 201
    end

    def update
        sandwich = load_sandwich(params[:id])
        if sandwich.nil?
            return
        end

        sandwich.update(sandwich_param)

        render json: sandwich.to_json(include: :ingredients), status: 201
    end

    def destroy
        sandwich = load_sandwich(params[:id])
        if sandwich.nil?
            return
        end

        sandwich.destroy

        render json: sandwich.to_json(include: :ingredients), status: 201

    end

    private

    def sandwich_params
        params.require(:sandwich).permit(:name, :bread_type)
    end

    def load_sandwich(id)
        sandwich = Sandwich.find_by(id: id)
        if sandwich.nil?
            render json: {error: "sandwich not found"}, status: 404
            return
        end
        return sandwich
    end

end