function prepareToAdd() {
    console.log("Ready to Add Ingredients!");
    $(".js-ingredient-btn").on("click", addIngredient);
}

function addIngredient(event){
    event.preventDefault;
    var $btn = $(event.currentTarget);
    console.log($btn);
    var sandwichId = $(".js-sandwich-update").data("hook");
    var ingredientId = $btn.data("hook");
    console.log("sandwich " + sandwichId)
    console.log("ingredient " + ingredientId);
    var postData = {ingredient_id: ingredientId};
    console.log(JSON.stringify(postData));

    $.ajax({
        type: "post",
        data: postData,
        url: '/api/sandwiches/' + sandwichId + '/ingredients/add',

        success: updateSandwiches,

        error: function(error) {
            console.log("LOSER!!!");
            console.log(error);
        }

    });
}

function updateSandwiches(sandwich){
    console.log("ready to update!");
    console.log(sandwich);
    var totalCalories = sandwich.total_calories;
    var ingredients = sandwich.ingredients;
    $(".js-sandwich-calories").text('Total Calories: ' + totalCalories);
    var ingredientList = ""
    ingredients.forEach( function(ingredient){
        ingredientList += `<li>${ingredient.name}</li>`
    });
    $(".js-ingredient-list").html(ingredientList);
}



