import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddAmountController extends GetxController {
  bool isincome = true;
  RxBool isLoading = false.obs;
  var Collection = FirebaseFirestore.instance.collection("transaction");

  onSelection(bool value) {
    isincome = value;
    update();
  }

  Future addNewRecord() async {
    isLoading.value = true;
    await Collection.add({
      "amount": 3567,
      "category": "fuel",
      "date": "02-01-2020",
      "note": "",
      "type": isincome ? "income" : "expense",
    });
    isLoading.value = false;
  }
}
