import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import 'helper.dart';

class NetworkHelper extends ChangeNotifier {
  Connectivity connectivity = Connectivity();

  /*
  * onConnectivityChanged return stream of Internet connectivity status
  * */
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;

  /*
  * isInternet return current true if internet is connected and false if no internet is connected
  * */
  Future<bool> isInternet({bool showSnackBar = true}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    if (showSnackBar) {
      BotToast.showText(
        text: "Please check your internet",
        contentColor: MyColor.warningColor!,
      );
    }
    return false;
  }
}
