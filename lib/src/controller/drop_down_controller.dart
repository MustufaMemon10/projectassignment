import 'package:get/get.dart';

class DropDownController extends GetxController{

  var selectedValue = 'Ascending-Decending'.obs;
  var dropDownMenuEntries = ['Ascending-Decending','Popularity','Price - High to Low','Price - Low to High'];

  void setSelectedValue(String value){
    selectedValue.value = value;
  }
  bool isSelected(String value) {
    return selectedValue.value == value;
  }
}