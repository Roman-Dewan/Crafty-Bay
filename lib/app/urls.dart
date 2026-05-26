class Urls {
  static const String _baseUrl = "https://ecom-rs8e.onrender.com/api";

  // Auth URLs
  static const String signUpUrl = "$_baseUrl/auth/signup";
  static const String signInUrl = "$_baseUrl/auth/login";
  static const String verifyOtpUrl = "$_baseUrl/auth/verify-otp";

  // Slides URL
  static const String slidesUrl = "$_baseUrl/slides";

  // Category URL
  static String getCategoriesUrl({required int page, required int count}) =>
      "$_baseUrl/categories?count=$count&page=$page";

  // Product URL
  static String getProductsUrl({
    required int page,
    required int count,
    required String categoryId,
  }) => "$_baseUrl/products?count=$count&page=$page&category=$categoryId";
}
