import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idigitech/Models/ShoppingModel.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';
import 'package:idigitech/Services.dart/Functions.dart';

class ShoppingCard extends StatelessWidget {
  final ShoppingData shoppingData;
  const ShoppingCard({super.key, required this.shoppingData});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: CstmTheme.accentColor,
        border: Border.all(color: CstmTheme.greydarkestColor),
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: CstmTheme.tertiaryColor.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 4.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Stack(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Expanded(
                flex: 1,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    child: Image.network(
                      shoppingData.img,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return Center(
                          child: Row(
                            children: const [
                              CircularProgressIndicator(
                                color: CstmTheme.primaryColor,
                              ),
                              Text('Loading...'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      shoppingData.title,
                      style: cstmTxtStyle(fs: 20, fw: FontWeight.w600),
                    ),
                    Text(
                      shoppingData.desc,
                      style:
                          cstmTxtStyle(fs: 14.0, fc: CstmTheme.tertiaryColor),
                    ),
                    Row(
                      children: [
                        dropDownTile(txt: "Size : S"),
                        const SizedBox(width: 5.0),
                        dropDownTile(txt: "Qty : 1"),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹${shoppingData.offerPrice}",
                          style: cstmTxtStyle(fs: 20.0, fw: FontWeight.w600),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          "₹${shoppingData.actualPrice}",
                          style: cstmTxtStyle(dc: TextDecoration.lineThrough),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          "${shoppingData.discount}% off",
                          style: cstmTxtStyle(),
                        ),
                      ],
                    ),
                    Text(
                      "Delivery By : Enter Pincode",
                      style: cstmTxtStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  dropDownTile({required String txt}) {
    return Container(
      // margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: CstmTheme.accentColor),
        color: CstmTheme.cardColor,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: CstmTheme.accentColor.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 2.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            txt,
            style: cstmTxtStyle(fw: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
