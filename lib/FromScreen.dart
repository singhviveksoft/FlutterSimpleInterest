import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_interest/Constant.dart';
import 'Asynous.dart';
import 'DropDown.dart';

class FormScree extends StatefulWidget {
  String title;
  bool fromTop;

  FormScree.onClick({Key? key, required this.title, required this.fromTop})
      : super(key: key);

  @override
  _FormScreeState createState() => _FormScreeState();
}

class _FormScreeState extends State<FormScree> {
  TextEditingController tc_input = TextEditingController();
  TextEditingController tc_output = TextEditingController();
  List<Length> _unit = [];
  List<DigitalStorage> _digitalunit = [];
  var _onit = ['Area4', 'Area5', 'Area6'];
  var manage_status = false;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isOnline = false;

  @override
  void initState() {
    _apicall();
    Background().initConnectivity(context);
    _connectivitySubscription =
        Background().connectivity.onConnectivityChanged.listen((event) {
     // Background().UpdateConnectionState(event, context);

      switch (event) {
        case ConnectivityResult.mobile:
          setState(() {
            isOnline = true;
          });

          break;
        case ConnectivityResult.wifi:
          setState(() {
            isOnline = true;
          });

          break;
        case ConnectivityResult.none:
          setState(() {
            isOnline = false;
          });

          break;
      }
    });
    /*      setState(() {
        Background.status = Background().getContinuesStatus(subscription);
        print('check status1 ${Background.status}');
       // _apicall(Background.status);
        //  update(Background.status,context);
      });*/

    super.initState();
  }

  String dropdownvalue1 = 'Meter';
  String dropdownvalue2 = 'Megabyte';

  void _apicall() {
    //  if(status==online_status) {
    Background().getdropDown(context).then((value) {
      setState(() {
        value.forEach((element) {
          _unit.add(element);
          print("jj");
        });
      });
    });
    //-------------------------
    Background().getDigitalStorage(context).then((value) {
      setState(() {
        value.forEach((element) {
          _digitalunit.add(element);
          print("jj");
        });
      });
    });
    /* }
      else{
        update(status,context);
      }*/
  }

  Future<List<Length>> getdropDown() async {
    var json =
        await DefaultAssetBundle.of(context).loadString("assets/dropdown.json");
    var decoder = JsonDecoder();
    var data = decoder.convert(json);
    List<dynamic> dropdownList = [];
    List<Length>? dropdownitem = [];

    if (data != null) {
      for (var item in data['Length']) {
        dropdownitem.add(Length.fromJson(item));
      }

      return dropdownitem;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [];
    print("ttt${_unit.length}");

      _unit.forEach((e) {
        menuItems.add(DropdownMenuItem(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                e.name.toString(),
                style: const TextStyle(
                  fontFamily: 'Hubballi',
                  fontSize: 25.0,
                ),
              ),
            ),
            value: e.name.toString()));
        print("lltt${_unit.length}");
      });

    //  if(menuItems.isEmpty)
    // dropdownvalue1 = menuItems[0].value.toString();

    return menuItems;
  }

  List<DropdownMenuItem<String>> get digitaldropdownItems {
    List<DropdownMenuItem<String>> menuItems = [];
    print("ttt${_digitalunit.length}");

      _digitalunit.forEach((e) {
        menuItems.add(DropdownMenuItem(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                e.name.toString(),
                style: const TextStyle(
                  fontFamily: 'Hubballi',
                  fontSize: 25.0,
                ),
              ),
            ),
            value: e.name.toString()));
        print("lltt${_digitalunit.length}");
      });

    //  dropdownvalue2 = menuItems[0].value.toString();

    return menuItems;
  }

  Widget _formFill() {
    // var i= dropdownItems;
    return Form(
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextFormField(
              onChanged: (value){
                if(!isOnline){
                  final snackBar = SnackBar(
                      content:
                      Text("You are OFFLINE "),
                      backgroundColor: isOnline ? Colors.green : Colors.red);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                }
              },
              keyboardType: TextInputType.number,
              controller: tc_input,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Plz enter Rate of Interest amt';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Input',
                  hintText: 'Input',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0)),
                child: DropdownButton<String>(
                  hint: Text('other'),
                  value: dropdownvalue1,
                  //  ask for position
                  items: dropdownItems,
                  onChanged: (String? newvalue) {
                    setState(() {
                      dropdownvalue1 = newvalue ?? 'other';
                    });
                  },

                  isExpanded: true,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
              )),
          SizedBox(
              width: 40.0,
              height: 40.0,
              child: Image.asset('images/blackboard.png')),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: tc_output,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Plz enter Rate of Interest amt';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Input',
                  hintText: 'Input',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0)),
                child: DropdownButton<String>(
                  value: dropdownvalue2,
                  hint: Text('other'),
                  //  ask for position
                  items: digitaldropdownItems,
                  onChanged: (String? newvalue) {
                    setState(() {
                      dropdownvalue2 = newvalue ?? 'other';
                    });
                  },

                  isExpanded: true,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
              )),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /* var item= dropdownItems;
   print("dd ${item.length}");*/
    if (!widget.fromTop &&
        digitaldropdownItems.isNotEmpty &&
        dropdownItems.isNotEmpty) {
      return Scaffold(
        body: _formFill(),
      );
    } else if (widget.fromTop &&
        digitaldropdownItems.isNotEmpty &&
        dropdownItems.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _formFill(),
      );
    } else  {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
