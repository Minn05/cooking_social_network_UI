import 'dart:convert';

CreateRecipeResponseModel createRecipeResponseModelFromJson(String str) =>
    CreateRecipeResponseModel.fromJson(json.decode(str));

String createRecipeResponseModelToJson(CreateRecipeResponseModel data) =>
    json.encode(data.toJson());



class CreateRecipeResponseModel {
  Recipes? recipes;

  CreateRecipeResponseModel({this.recipes});

  CreateRecipeResponseModel.fromJson(Map<String, dynamic> json) {
    recipes =
        json['recipes'] != null ? new Recipes.fromJson(json['recipes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.toJson();
    }
    return data;
  }
}

class Recipes {
  String? image;
  String? nameOfRecipe;
  String? description;
  String? typeOfRecipe;
  int? calories;
  String? mealPortion;
  String? preTime;
  List<String>? ingredients;
  List<String>? step;
  String? user;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Recipes(
      {this.image,
      this.nameOfRecipe,
      this.description,
      this.typeOfRecipe,
      this.calories,
      this.mealPortion,
      this.preTime,
      this.ingredients,
      this.step,
      this.user,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Recipes.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    nameOfRecipe = json['nameOfRecipe'];
    description = json['description'];
    typeOfRecipe = json['typeOfRecipe'];
    calories = json['calories'];
    mealPortion = json['mealPortion'];
    preTime = json['preTime'];
    ingredients = json['ingredients'].cast<String>();
    step = json['step'].cast<String>();
    user = json['user'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    data['user'] = this.user;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}