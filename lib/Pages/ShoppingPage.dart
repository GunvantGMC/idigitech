// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idigitech/Models/ShoppingModel.dart';
import 'package:idigitech/Models/StepperIcon.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';
import 'package:idigitech/Services.dart/Functions.dart';
import 'package:idigitech/Widgets/CntrBtn.dart';
import 'package:idigitech/Widgets/CstmAppBar.dart';
import 'package:idigitech/Widgets/CustomStepper.dart';
import 'package:idigitech/Widgets/ShoppingCard.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<StepperIcon> stepperIconList = [];
  List<ShoppingData> shoppingDataList = [];

  @override
  void initState() {
    initStepperIconList();
    initShoppingDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CstmAppBar(
          title: "Shopping Bag",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomStepper(
              iconList: stepperIconList,
            ),
            // SizedBox(height: 15.0),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: CstmTheme.secondaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bag Items : ${shoppingDataList.length}",
                    style: cstmTxtStyle(
                      fc: CstmTheme.tertiaryColor,
                      fs: 20,
                      fw: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Total : ₹4500",
                    style: cstmTxtStyle(
                        fc: CstmTheme.tertiaryColor,
                        fs: 20,
                        fw: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: cstmTextField(
                      cntrl: TextEditingController(),
                      hintText: "Enter Pincode",
                    ),
                  ),
                  CntrBtn(
                    title: "Verify",
                    hrMargin: 5.0,
                    onBtnPressed: () => showCstmSnackBar(
                        context: context, msg: "Under Development"),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ShoppingCard(
                shoppingData: shoppingDataList[index],
              ),
              itemCount: shoppingDataList.length,
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              width: width,
              decoration: BoxDecoration(
                color: CstmTheme.secondaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        spacing: 3,
                        children: [
                          Icon(Icons.offline_pin_rounded),
                          Text(
                            "Available Offers",
                            style: cstmTxtStyle(fs: 18, fw: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(1.0),
                        width: width * 0.37,
                        child: Divider(
                          color: CstmTheme.tertiaryColor,
                          height: 1,
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.0),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: CstmTheme.blackColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Flexible(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: cstmTxtStyle(hg: 1.2),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(1.0),
                      width: width * 0.37,
                      alignment: Alignment.topRight,
                      child: Column(
                        children: [
                          Text(
                            "More Offers",
                            style: cstmTxtStyle(fs: 18, fw: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: CstmTheme.tertiaryColor,
                            height: 1,
                            thickness: 1.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: CstmTheme.secondaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_offer_outlined),
                  SizedBox(width: 10.0),
                  Text(
                    "Apply Coupon",
                    style: cstmTxtStyle(fs: 20.0, fw: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: CstmTheme.secondaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const Icon(Icons.currency_rupee_rounded),
                  SizedBox(width: 10.0),
                  Text(
                    "Apply Reward (100 Coins)",
                    style: cstmTxtStyle(fs: 20.0, fw: FontWeight.w500),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Checkbox(
                        onChanged: (bool? value) {},
                        value: false,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: CstmTheme.accentColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: CstmTheme.greydarkestColor.withOpacity(0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CstmTheme.greydarkestColor.withOpacity(0.5),
                    offset: const Offset(0, 4),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Summary",
                    style: cstmTxtStyle(fs: 18, fw: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          color: CstmTheme.primaryColor,
                          height: 1,
                          thickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total MRP",
                        style: cstmTxtStyle(),
                      ),
                      Text(
                        "₹ 5000",
                        style: cstmTxtStyle(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: cstmTxtStyle(),
                      ),
                      Text(
                        "₹ 500",
                        style: cstmTxtStyle(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Coupon Discount",
                        style: cstmTxtStyle(),
                      ),
                      Text(
                        "Apply Discount",
                        style: cstmTxtStyle(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping Charges",
                        style: cstmTxtStyle(),
                      ),
                      Text(
                        "₹ 100 Free",
                        style: cstmTxtStyle(dc: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: CstmTheme.secondaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: cstmTxtStyle(fs: 20.0, fw: FontWeight.w500),
                  ),
                  Text(
                    "₹4500",
                    style: cstmTxtStyle(fs: 20.0, fw: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: CstmTheme.secondaryColor,
                    height: 1,
                    thickness: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            CntrBtn(
                title: "Add Address",
                onBtnPressed: () {
                  showCstmSnackBar(context: context, msg: "Under Development");
                }),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  void initStepperIconList() {
    stepperIconList.addAll([
      StepperIcon(no: 1, title: "Bag", isCompleted: true),
      StepperIcon(no: 2, title: "Address"),
      StepperIcon(no: 3, title: "Payment"),
    ]);
  }

  void initShoppingDataList() {
    shoppingDataList.addAll([
      ShoppingData(
        title: "Greenfab",
        desc: "Anarkali kurta with dupatta set",
        img:
            "https://cdn.shopify.com/s/files/1/1073/2728/products/DB2046_960x.jpg?v=1613476192",
        offerPrice: (1500 - (1500 * 0.25)).toInt(),
        actualPrice: 1500,
        discount: 25,
      ),
      ShoppingData(
        title: "Greenfab",
        desc: "Anarkali kurta with dupatta set",
        img:
            "https://cdn.shopify.com/s/files/1/1073/2728/products/DB2046_960x.jpg?v=1613476192",
        offerPrice: (1500 - (1500 * 0.25)).toInt(),
        actualPrice: 1500,
        discount: 25,
      ),
      ShoppingData(
        title: "Greenfab",
        desc: "Anarkali kurta with dupatta set",
        img:
            "https://cdn.shopify.com/s/files/1/1073/2728/products/DB2046_960x.jpg?v=1613476192",
        offerPrice: (1500 - (1500 * 0.25)).toInt(),
        actualPrice: 1500,
        discount: 25,
      ),
      ShoppingData(
        title: "Greenfab",
        desc: "Anarkali kurta with dupatta set",
        img:
            "https://cdn.shopify.com/s/files/1/1073/2728/products/DB2046_960x.jpg?v=1613476192",
        offerPrice: (1500 - (1500 * 0.25)).toInt(),
        actualPrice: 1500,
        discount: 25,
      ),
    ]);
  }
}
