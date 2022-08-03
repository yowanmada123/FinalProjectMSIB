import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OScaffold extends StatelessWidget {
  final Color backgroundColor;
  final Widget body;
  final Widget? bottomNavigationBar;
  final String? title;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const OScaffold({this.title, required this.body, this.floatingActionButton, this.floatingActionButtonLocation, this.backgroundColor = Colors.white, this.bottomNavigationBar, this.actions});

  @override
  Widget build(BuildContext context) {
    // final gstate = Get.find<GlobalController>();

    return Scaffold(
        backgroundColor: backgroundColor,
        // Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
          backgroundColor: Color(0xffFFA593),
          // Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          centerTitle: true,
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
          ),
            title: Text(
              title ?? "", style: TextStyle(color: Colors.white, fontSize: 15),
            // title ?? '',
          ),
          elevation: 2,
          actions: actions,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          // toolbarHeight: gstate.toolbarHeight,
        ),
        body: SafeArea(child: body),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar);
  }
}
