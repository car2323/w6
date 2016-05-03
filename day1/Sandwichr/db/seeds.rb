sandwich1=Sandwich.create(name: 'carlos_special', bread_type: 'venezuelan',total_calories: 0)
sandwich2=Sandwich.create(name: 'andrezas_special', bread_type: 'brazilian',total_calories: 0)
sandwich3=Sandwich.create(name: 'alvaros_special', bread_type: 'nicaraguan',total_calories: 0)

ingredient1=Ingredient.create(name: 'Ham', calories: 70)
ingredient2=Ingredient.create(name: 'Turkey', calories: 100)
ingredient3=Ingredient.create(name: 'Lettuce', calories: 10)
ingredient4=Ingredient.create(name: 'Tomato', calories: 20)
ingredient5=Ingredient.create(name: 'chesee', calories: 200)

SandwichIngredient.create(sandwich_id: sandwich3, ingredient_id: ingredient1)
SandwichIngredient.create(sandwich_id: sandwich3, ingredient_id: ingredient5)
SandwichIngredient.create(sandwich_id: sandwich3, ingredient_id: ingredient3)
SandwichIngredient.create(sandwich_id: sandwich3, ingredient_id: ingredient4)
SandwichIngredient.create(sandwich_id: sandwich2, ingredient_id: ingredient2)
SandwichIngredient.create(sandwich_id: sandwich2, ingredient_id: ingredient5)





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
