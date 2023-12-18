class Config {
  static const String appName = "Cooking Social Network";
  static const String apiUrl = "192.168.117.1:8000";
  static const String loginApi = "/api/auth/login";
  static const String registerApi = "/api/auth/register";
  static const String getUserApi = "/api/users/:id";
  static const String getAllRecipe = 'api/recipes/';
  static const String createRecipe = 'api/recipes/';
  static const String updateRecipde = 'api/recipes/:recipeId';
  static const String deleteRecipe = 'api/recipes/:recipeId';
}
