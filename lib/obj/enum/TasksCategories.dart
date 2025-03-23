
import 'package:daily_expense_management/obj/enum/ErrorEnum.dart';
import 'package:flutter/material.dart';

class TaskCategories{
  static final Map<String, IconData> categories = {
    "Add New": Icons.add,
    "Eat": Icons.fastfood,
    "Transportation": Icons.directions_car,
    "Health": Icons.healing,
    "Entertainment": Icons.movie,
    "Education": Icons.school,
    "Shopping": Icons.shopping_cart,
    "Investment": Icons.attach_money,
    "Rent": Icons.home,
  };

  static int addCategory(Map<String, IconData> category) {
    int rs = 0;
    if (categories.isEmpty) {
      rs = ErrorEnum.ERROR_EMPTY;
      return rs;
    }
    if (!categories.containsKey(category.keys.first)) {
      categories[category.keys.first] = category.values.first;
      rs = ErrorEnum.NO_ERROR;
    } else {
      rs = ErrorEnum.ERROR_EXISTED;
    }
    return rs;
  }

  static int removeCategory(Map<String, IconData> category) {
    int rs = 0;
    if (categories.isEmpty) {
      rs = ErrorEnum.ERROR_EMPTY;
      return rs;
    }
    if (categories.containsKey(category.keys.first)) {
      categories.remove(category.keys.first);
      rs = ErrorEnum.NO_ERROR;
    } else {
      rs = ErrorEnum.ERROR_NOT_EXISTED;
    }
    return rs;
  }

  static Map<String, IconData> getItemCategoryAtIndex(int index) {
    Map<String, IconData> item = {};
    if (index < 0 || index >= categories.length) {
      return item;
    }
    item = {categories.keys.elementAt(index): categories.values.elementAt(index)};
    return item;
  }
}