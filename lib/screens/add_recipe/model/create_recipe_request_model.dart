class CreateRecipeRequestModel {
  String? image;
  String? nameOfRecipe;
  String? description;
  String? typeOfRecipe;
  String? calories;
  String? mealPortion;
  String? preTime;
  List<String>? ingredients;
  List<String>? step;

  CreateRecipeRequestModel({
    this.image,
    this.nameOfRecipe,
    this.description,
    this.typeOfRecipe,
    this.calories,
    this.mealPortion,
    this.preTime,
    this.ingredients,
    this.step,
  });

  CreateRecipeRequestModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    nameOfRecipe = json['nameOfRecipe'];
    description = json['description'];
    typeOfRecipe = json['typeOfRecipe'];
    calories = json['calories'];
    mealPortion = json['mealPortion'];
    preTime = json['preTime'];
    ingredients = json['ingredients'].cast<String>();
    step = json['step'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['nameOfRecipe'] = this.nameOfRecipe;
    data['description'] = this.description;
    data['typeOfRecipe'] = this.typeOfRecipe;
    data['calories'] = this.calories;
    data['mealPortion'] = this.mealPortion;
    data['preTime'] = this.preTime;
    data['ingredients'] = this.ingredients;
    data['step'] = this.step;

    return data;
  }
}
