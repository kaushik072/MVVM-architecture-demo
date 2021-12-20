import 'package:flutter/material.dart';
import 'package:test_project/helper/helper.dart';
import 'package:test_project/models/models.dart';

class DrugDetailItem extends StatelessWidget {
  const DrugDetailItem(
      {required this.associatedDrugModel, this.isTitle = false});
  final AssociatedDrugModel associatedDrugModel;
  final bool isTitle;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      child: Container(
        height: 60,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        color: MyColor.mainColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        associatedDrugModel.name ?? "",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: isTitle
                                  ? MyColor.black
                                  : MyColor.textPrimaryDarkColor
                                      ?.withOpacity(0.8),
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        associatedDrugModel.dose != ""
                            ? (associatedDrugModel.dose ?? "")
                            : "~",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: isTitle
                                  ? MyColor.black
                                  : MyColor.textPrimaryDarkColor
                                      ?.withOpacity(0.8),
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        associatedDrugModel.strength ?? "",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: isTitle
                                  ? MyColor.black
                                  : MyColor.textPrimaryDarkColor
                                      ?.withOpacity(0.8),
                            ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
