import 'package:get/get.dart';
import 'package:projectassignment/src/controller/product_controller.dart';
import 'package:projectassignment/src/screens/product_screen.dart';

class TTabController extends GetxController{
  static  TTabController get instance => Get.find();
  /// Variables
  final productController = Get.put(ProductController());
  final List<String> categories = [
    'Beauty',
    'Fragrances',
    'Groceries'
  ];
  var currentIndex = 0.obs;
  var screens =[
     ProductScreen(),ProductScreen(),ProductScreen(),
  ];
  void changeTabIndex(int index) {
    switch (index) {
      case 0:
      // Handle Beauty category
        currentIndex.value = index;
        break;
      case 1:
      // Handle Fragrances category
        currentIndex.value = index;
        break;
      case 2:
      // Handle Groceries category
        currentIndex.value = index;
        break;
      default:
        currentIndex.value = 0;
        break;
    }
  }
  bool isSelected(int value) {
    return currentIndex.value == value;
  }

}