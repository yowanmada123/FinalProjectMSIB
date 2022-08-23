import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:resto_mobile/data/data_product.dart';
import 'package:resto_mobile/page/home/item_widget_category.dart';
import 'package:resto_mobile/utils/color.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final locations = ['Surabaya', 'Sidoarjo', 'Bali', 'Solo', 'Lamongan', 'Madiun'];
  int selectedLocation = -1;
  final filters = ['Open', 'Sale Off', 'Pick up', 'Verified', 'Preferred', 'Ordered'];
  int selectedFilter = -1;
  int selectedCategory = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.close_rounded)),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Filter",
                        style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = -1;
                        selectedLocation = -1;
                        selectedCategory = -1;
                      });
                    },
                    child: Text(
                      "Clear all",
                      style: TextStyle(fontSize: 14, color: Colors.grey[500], fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 130,
                width: Get.width,
                child: Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = index;
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: selectedCategory == index ? primaryColor : Colors.grey[100],
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Image.asset(allData[index].imagecategory)),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    // alignment: Alignment.center,
                                    allData[index].category,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12, color: Color(0xff6B5E5E), fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 90,
                child: GridView.builder(
                    // shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: locations.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 6),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // ontap of each card, set the defined int to the grid view index
                            selectedLocation = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: selectedLocation == index ? primaryColor : Colors.grey[100],
                            ),
                            height: 10,
                            width: 10,
                            child: Center(
                              child: Text(
                                locations[index],
                                // '$index',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: selectedLocation == index ? Colors.white : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Filter by",
                    style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 90,
                child: GridView.builder(
                    // shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: filters.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 6),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // ontap of each card, set the defined int to the grid view index
                            selectedFilter = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: selectedFilter == index ? primaryColor : Colors.grey[100],
                            ),
                            height: 10,
                            width: 10,
                            child: Center(
                              child: Text(
                                filters[index],
                                // '$index',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: selectedFilter == index ? Colors.white : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Form(
                      // key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey[100],
                              prefixIconColor: Colors.grey[100],
                              hoverColor: Colors.grey[100],
                              // icon: const Icon(Icons.email_outlined, size: 18, color: Colors.grey),
                              prefixIcon: const Icon(Icons.attach_money, size: 18, color: Colors.grey),
                              // labelText: 'Input email',
                              hintText: 'Minimum',
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
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Form(
                      // key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey[100],
                              prefixIconColor: Colors.grey[100],
                              hoverColor: Colors.grey[100],
                              // icon: const Icon(Icons.email_outlined, size: 18, color: Colors.grey),
                              prefixIcon: const Icon(Icons.attach_money, size: 18, color: Colors.grey),
                              // labelText: 'Input email',
                              hintText: 'Maximum',
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: primaryColor,
                  ),
                  child: const Center(
                    child: Text(
                      "Apply",
                      style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
