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
    'tablets',
    'sports-accessories',
    'mobile-accessories',
    'beauty',
    'fragrances',
    'groceries',
    'womens-dresses',
    'skin-care',
    'vehicle',
  ];
  var selectedCategory = 'tablets'.obs;
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
      final response = await http.get(Uri.parse('https://dummyjson.com/products/category/$selectedCategory'));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body)['products'];
        List<ProductModel> productList = body.map((dynamic item) => ProductModel.fromJson(item)).toList();
        products.assignAll(productList);

        // Debugging: Print the product list
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

  void changeCategory(String category) {
    selectedCategory.value = category;
    fetchProducts(selectedCategory);
  }

  bool isSelected(String category) {
    return selectedCategory.value == category;
  }

  List<ProductModel> sortProducts(List<ProductModel> products) {
    switch (dropDownController.selectedValue.value) {
      case 'Popularity':
        products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Price - High to Low':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Price - Low to High':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      default:
        break;
    }
    return products;
  }
}
