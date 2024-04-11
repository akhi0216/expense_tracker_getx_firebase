// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:expense_tracker_getx_firebase/controller/addamount_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAmount extends StatefulWidget {
  const AddAmount({super.key});

  @override
  State<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends State<AddAmount> {
  // AddAmountController controller = AddAmountController();
  AddAmountController controller = Get.put(AddAmountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GetBuilder<AddAmountController>(
              builder: (_) => Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: controller.onSelection(true),
                    child: Container(
                      color: controller.isincome ? Colors.black : Colors.white,
                      //  controller.isincome == true
                      //     ? Colors.black
                      //     : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "income",
                          style: TextStyle(
                            color: controller.isincome
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: controller.onSelection(false),
                    child: Container(
                      color: controller.isincome ? Colors.white : Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "expense",
                          style: TextStyle(
                            color: controller.isincome
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("amount")),
            ),
            SizedBox(
              height: 7,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("category")),
            ),
            SizedBox(
              height: 7,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("date")),
            ),
            SizedBox(
              height: 7,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("notes")),
            ),
            SizedBox(
              height: 11,
            ),
            Obx(() => controller.isLoading.value == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InkWell(
                    onTap: () async {
                      await controller.addNewRecord();
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        "Add Record",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ))
            // Container(
            //   decoration: BoxDecoration(color: Colors.black),
            //   child: Text(
            //     "add record",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
