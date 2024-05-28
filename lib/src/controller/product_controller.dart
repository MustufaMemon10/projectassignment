import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:projectassignment/src/controller/drop_down_controller.dart';
import 'package:projectassignment/src/models/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final categories = [
    'Smartphones',
    'Laptops',
    'Home-Decoration',
    'Groceries',
    'Fragrances',
    'Skin-care',
    'Beauty',
  ];
  var selectedCategory = 'Smartphones'.obs;
  final searchQuery = ''.obs;

  List<ProductModel> products = <ProductModel>[].obs;
  final DropDownController dropDownController = Get.put(DropDownController());

  @override
  void onInit() {
    fetchProducts(selectedCategory);
    super.onInit();
  }

  /// Fetch Product according to category
  Future<void> fetchProducts(RxString category) async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('https://dummyjson.com/products/category/$category'));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body)['products'];
        List<ProductModel> productList = body.map((dynamic item) => ProductModel.fromJson(item)).toList();
        products.assignAll(productList);

        if (kDebugMode) {
          print('Products fetched: ${products.length}');
        }
      } else {
        // Handle the case when the response is not successful
        products.clear();
        if (kDebugMode) {
          print('Failed to fetch products: ${response.statusCode}');
        }
      }
    } catch (e) {
      products.clear(); // Ensure the product list is cleared in case of an error
      if (kDebugMode) {
        print('Error fetching products: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  List<ProductModel> get filteredProducts {
    return products.where((product) => product.category == selectedCategory.value).toList();
  }
  void searchAndSortProducts(String query) {
    searchQuery.value = query;
    sortProducts();
  }
  void sortProducts() {
    // Apply sorting logic based on selectedSortCriteria and searchQuery
    List<ProductModel> sortedList = products;
    // Filter by searchQuery if it's not empty
    if (searchQuery.isNotEmpty) {
      sortedList = sortedList.where((product) =>
      product.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          product.category.toLowerCase().contains(
              searchQuery.value.toLowerCase())).toList();
    }
    // Sort based on selectedSortCriteria
    switch (dropDownController.selectedValue.value) {
      case 'Price - Low to High':
        sortedList.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price - High to Low':
        sortedList.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Popularity':
        sortedList.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Ascending-Decending':
        sortedList.sort((a, b) => a.title.compareTo(b.title));
        break;
      default:
      // Default sorting logic if no criteria selected
        sortedList.sort((a, b) => a.id.compareTo(b.id));
        break;
    }
    products.assignAll(sortedList);
  }
  void changeCategory(String category) {
    selectedCategory.value = category;
    fetchProducts(selectedCategory);
  }

  bool isSelected(String category) {
    return selectedCategory.value == category;
  }

}
