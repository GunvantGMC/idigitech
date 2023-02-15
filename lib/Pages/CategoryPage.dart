// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idigitech/Models/CategoryModel.dart';
import 'package:idigitech/Models/StepperIcon.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';
import 'package:idigitech/Services.dart/Functions.dart';
import 'package:idigitech/Widgets/CategoryCard.dart';
import 'package:idigitech/Widgets/CstmAppBar.dart';
import 'package:idigitech/Widgets/CustomStepper.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<StepperIcon> stepperIconList = [];
  List<CategoryData> categoriesDataList = [];

  @override
  void initState() {
    initStepperIconList();
    fillCategoriesDataListList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CstmAppBar(
          title: "Categories",
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: CstmTheme.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: getMenuIconWithLabel(iconData: Icons.home, label: "Home"),
            ),
            Expanded(
              child: getMenuIconWithLabel(
                iconData: Icons.category,
                label: "Categories",
                isActive: true,
              ),
            ),
            Spacer(),
            Expanded(
              child: getMenuIconWithLabel(
                  iconData: Icons.favorite, label: "Wishlist"),
            ),
            Expanded(
              child: getMenuIconWithLabel(
                  iconData: Icons.wallet, label: "Wallet "),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CstmTheme.dynColor(0xFFFAFAFA),
        ),
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: CstmTheme.primaryColor,
          child: Icon(Icons.checkroom),
          onPressed: () {
            showCstmSnackBar(context: context, msg: "Under Development");
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.0),
            CustomStepper(
              iconList: stepperIconList,
            ),
            SizedBox(height: 10.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (context, index) =>
                  CategoryCard(category: categoriesDataList[index]),
              itemCount: categoriesDataList.length,
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  void initStepperIconList() {
    stepperIconList.addAll([
      StepperIcon(no: 1, title: "Select Category", isCompleted: true),
      StepperIcon(no: 2, title: "Select Fabric", isCompleted: true),
      StepperIcon(no: 3, title: "Select Garment", isCompleted: true),
      StepperIcon(no: 4, title: "Customizations"),
    ]);
  }

  void fillCategoriesDataListList() {
    categoriesDataList.addAll([
      CategoryData(
          title: "Kurta",
          img:
              "https://cdn08.nnnow.com/web-images/large/styles/EWPJY0OGKW7/1651826440690/1.jpg"),
      CategoryData(
          title: "Dupatta",
          img: "https://m.media-amazon.com/images/I/61P-N08dLsL._UY550_.jpg"),
      CategoryData(
          title: "Saree",
          img:
              "https://newcdn.kalkifashion.com/media/catalog/product/m/a/maroon_saree_in_georgette_with_kundan_embellished_border-k002srpset006y-sg91077_2_.jpg"),
      CategoryData(
          title: "Kurta",
          img:
              "https://rajubhaihargovindas.com/10676-large_default/black-sequin-embellished-chikankari-kurta-set.jpg"),
    ]);
  }

  getMenuIconWithLabel(
      {required IconData iconData, required String label, isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.all(3.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? CstmTheme.whiteColor : CstmTheme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            color: isActive ? CstmTheme.primaryColor : CstmTheme.accentColor,
          ),
        ),
        Text(
          label,
          style: cstmTxtStyle(fc: CstmTheme.accentColor),
        ),
      ],
    );
  }
}
