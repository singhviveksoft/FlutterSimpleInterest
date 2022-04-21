import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'Constant.dart';
import 'DropDown.dart';

class Background {
  static String status = offline_status;
  var manage_status = false;
  late StreamSubscription<ConnectivityResult> subscription;

  Future<List<Length>> getdropDown(BuildContext context) async {
    List<dynamic> dropdownList = [];
    List<Length>? dropdownitem = [];

    try {
      var json = await DefaultAssetBundle.of(context)
          .loadString("assets/dropdown.json");
      var decoder = JsonDecoder();
      var data = decoder.convert(json);
      if (data != null) {
        for (var item in data['Length']) {
          dropdownitem.add(Length.fromJson(item));
        }
      }
      return dropdownitem;
    } on Exception catch (e) {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<DigitalStorage>> getDigitalStorage(BuildContext context) async {
    List<dynamic> dropdownList = [];
    List<DigitalStorage>? dropdownitem = [];

    try {
      var json = await DefaultAssetBundle.of(context)
          .loadString("assets/dropdown.json");
      var decoder = JsonDecoder();
      var data = decoder.convert(json);

      if (data != null) {
        for (var item in data['Digital Storage']) {
          dropdownitem.add(DigitalStorage.fromJson(item));
        }
      }
      return dropdownitem;
    } on Exception catch (e) {
      throw "Unable to retrieve posts.";
    }
  }

  //--------------------------
  final Connectivity _connectivity = Connectivity();

  Connectivity get connectivity => _connectivity;

  Future<void> initConnectivity(BuildContext context) async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print("Error Occurred: ${e.toString()} ");
      return;
    }
    /*if (!mounted) {
      return Future.value(null);
    }*/
    return UpdateConnectionState(result, context);
  }

  Future<void> UpdateConnectionState(
      ConnectivityResult result, BuildContext context) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      manage_status = true;
      showStatus(result, true, context);
    } else {
      manage_status = false;
      showStatus(result, false, context);
    }
  }

  void showStatus(
      ConnectivityResult result, bool status, BuildContext context) {
    final snackBar = SnackBar(
        content:
            Text("${status ? 'ONLINE\n' : 'OFFLINE\n'}${result.toString()} "),
        backgroundColor: status ? Colors.green : Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
