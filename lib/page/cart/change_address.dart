import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';

import '../../global_controller.dart';

class ChangeAddressPage extends StatefulWidget {
  const ChangeAddressPage({super.key});

  @override
  State<ChangeAddressPage> createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
  final gstate = Get.put(GlobalController());
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      title: "Change Address",
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Address Now"),
            SizedBox(
              height: 10,
            ),
            Text(gstate.address.toString(), style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text("Change Your Address Here."),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: "Input your address",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                gstate.address.value = addressController.text;
                print(gstate.address.value);
                Get.back();
              },
              child: Container(
                height: 40,
                width: Get.width * 0.5,
                decoration: BoxDecoration(color: OprimaryColor, borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
