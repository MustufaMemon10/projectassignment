import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectassignment/src/controller/product_controller.dart';
import 'package:projectassignment/src/controller/tab_controller.dart';
import 'package:projectassignment/src/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment App',
      initialBinding: BindingsBuilder((){
        Get.put(ProductController());
        Get.put(TTabController());
             }),
      home:  const HomeScreen(),
    );
  }
}
