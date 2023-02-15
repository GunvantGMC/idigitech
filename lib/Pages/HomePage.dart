// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idigitech/Pages/CategoryPage.dart';
import 'package:idigitech/Pages/ShoppingPage.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';
import 'package:idigitech/Services.dart/Functions.dart';
import 'package:idigitech/Widgets/CntrBtn.dart';
import 'package:idigitech/Widgets/CstmAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CstmAppBar(title: "I-Digitech"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CntrBtn(
              title: "Categories",
              onBtnPressed: () {
                changePage(context: context, page: CategoryPage());
              }),
          CntrBtn(
              title: "Shopping Bag",
              onBtnPressed: () {
                changePage(context: context, page: ShoppingPage());
              })
        ],
      ),
    );
  }
}
