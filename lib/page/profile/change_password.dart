import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/page/profile/otp_input.dart';
import 'package:resto_mobile/utils/color.dart';
import 'package:resto_mobile/widget/base/form/form_scaffold.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isPesanAntar = true;

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      if (kDebugMode) {
        print('Got a valid input');
      }
      // And do something here
    }
  }

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      title: "Change Password",
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Forgot Password", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.black87)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Enter your email", style: TextStyle(fontSize: 15, color: Colors.grey[400])),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.grey[100],
                                prefixIconColor: Colors.grey[100],
                                hoverColor: Colors.grey[100],
                                icon: const Icon(Icons.email_outlined, size: 18, color: Colors.grey),
                                // labelText: 'Input email',
                                hintText: 'Input email',
                                focusColor: Colors.grey[100],
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 0.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 0.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                if (value != null && !value.contains('@')) {
                                  return 'Input the right email';
                                }
                                return null;
                              },
                              // decoration: const InputDecoration(labelText: 'Enter Your Name', border: OutlineInputBorder(), errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
                            ),
                            // const SizedBox(
                            //   height: 30,
                            // ),
                            // ElevatedButton.icon(onPressed: _saveForm, icon: const Icon(Icons.save), label: const Text('Save'))
                          ],
                        ),
                      ),
                      // TextField(
                      //   decoration: InputDecoration(
                      //       fillColor: Colors.grey[100],
                      //       prefixIconColor: Colors.grey[100],
                      //       hoverColor: Colors.grey[100],
                      //       icon: const Icon(Icons.email_outlined, size: 18, color: Colors.grey),
                      //       // labelText: 'Input email',
                      //       hintText: 'Input email',
                      //       focusColor: Colors.grey[100],
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(width: 0.1, color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(width: 0.1, color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //   ),
                      // ),

                      // Container(
                      //   height: 50,
                      //   decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
                      //   child: Row(
                      //     children: const [
                      //       SizedBox(
                      //         width: 25,
                      //       ),
                      //       Icon(Icons.email_outlined, size: 18, color: Colors.grey),
                      //       SizedBox(
                      //         width: 20,
                      //       ),
                      //       Text("Input email", style: TextStyle(fontSize: 13, color: Colors.grey)),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _saveForm;
                          Get.to(const OtpInputPage());
                        },
                        child: Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text("Next", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class BuildSettingItem extends StatelessWidget {
  const BuildSettingItem({Key? key, required this.item, required this.ontap, required this.contain}) : super(key: key);
  final String contain;
  final String item;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey)),
            Text(contain, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}

class BuildItem extends StatelessWidget {
  final String judul;
  final String orderStatus;
  final String time;

  const BuildItem({Key? key, required this.judul, required this.orderStatus, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.00, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Color(0xffC5F0EF), borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.food_bank,
                    color: Color(0xffDD1138),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      judul,
                      style: const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      orderStatus,
                      style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // time,
                      time,
                      style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
