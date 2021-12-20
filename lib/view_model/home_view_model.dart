import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:test_project/models/models.dart';
import 'package:test_project/repository/repository.dart';

import '../helper/helper.dart';

class HomeViewModel with ChangeNotifier {
  HomeRepository homeRepository = HomeRepository();
  NetworkHelper networkHelper = NetworkHelper();
  List<ProblemsModel>? problems;
  List<AssociatedDrugModel>? associatedDrugs;
  /*
   * Get the Geet Message from current Time 
   * */
  String getGreetMessage() {
    DateTime currentTime = new DateTime.now();
    if (currentTime.hour > 12) {
      return "AfterNoon";
    }
    return "Morning";
  }

  Future<List<ProblemsModel>?> getProblems() async {
    bool? isOn = await networkHelper.isInternet();
    if (isOn) {
      final getProblemResponse = await homeRepository.getProblems();
      if (getProblemResponse != null) {
        problems = getProblemResponse;
        associatedDrugs = [];
        problems!.forEach((problem) {
          problem.diabetes!.forEach((diabetesItem) {
            diabetesItem.medications!.forEach((medicationItem) {
              medicationItem.medicationsClasses!
                  .forEach((medicationsClassesItem) {
                medicationsClassesItem.className!.forEach((classNameItem) {
                  classNameItem.associatedDrug!.forEach((associatedDrugItem) {
                    associatedDrugs!.add(associatedDrugItem);
                  });
                  classNameItem.associatedDrug2!.forEach((associatedDrug2Item) {
                    associatedDrugs!.add(associatedDrug2Item);
                  });
                });
                medicationsClassesItem.className2!.forEach((className2Item) {
                  className2Item.associatedDrug!.forEach((associatedDrugItem) {
                    associatedDrugs!.add(associatedDrugItem);
                  });
                  className2Item.associatedDrug2!.forEach((associatedDrug2Item) {
                    associatedDrugs!.add(associatedDrug2Item);
                  });
                });
              });
            });
          });
        });
        notifyListeners();
      } else {
        BotToast.showText(
          text: "Something went wrong!",
          contentColor: MyColor.warningColor!,
        );
      }
    } else {
      BotToast.showText(
        text: "Your internet connection is OFF.",
        contentColor: MyColor.warningColor!,
      );
    }
  }
}
