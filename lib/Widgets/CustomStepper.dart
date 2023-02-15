import 'package:flutter/material.dart';
import 'package:idigitech/Models/StepperIcon.dart';
import 'package:idigitech/Services.dart/CstmTheme.dart';
import 'package:idigitech/Services.dart/Functions.dart';

class CustomStepper extends StatelessWidget {
  List<StepperIcon> iconList;

  CustomStepper({super.key, required this.iconList});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 70,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, i) {
          return Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: (width / (iconList.length * 2 - 1)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 25.0,
                        width: 25.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              iconList[i].isCompleted || iconList[i].isSelected
                                  ? CstmTheme.secondaryColor
                                  : CstmTheme.accentColor,
                        ),
                        child: Text(
                          "${iconList[i].no}",
                          style: cstmTxtStyle(
                            fc: iconList[i].isCompleted ||
                                    iconList[i].isSelected
                                ? CstmTheme.tertiaryColor
                                : CstmTheme.greydarkestColor,
                            fw: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        iconList[i].title,
                        style: cstmTxtStyle(
                          fc: iconList[i].isCompleted || iconList[i].isSelected
                              ? CstmTheme.tertiaryColor
                              : CstmTheme.greydarkestColor,
                          fs: 14,
                          fw: FontWeight.w600,
                          hg: 1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                if (iconList.length - 1 != i)
                  Container(
                    padding: const EdgeInsets.only(top: 13.0),
                    width: (width / (iconList.length * 2)),
                    child: const Divider(
                      thickness: 1,
                      height: 1,
                      color: CstmTheme.tertiaryColor,
                    ),
                  )
              ],
            ),
          );
        },
        itemCount: iconList.length,
      ),
    );
  }
}
