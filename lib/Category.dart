import 'dart:async';
import 'dart:ui';
import 'package:backdrop/backdrop.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_interest/DropDown.dart';
import 'Asynous.dart';

import 'Constant.dart';
import 'FromScreen.dart';
import 'Navigation.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routing.unit,
    onGenerateRoute: Routing.generateRoute,
    theme: ThemeData(
      primaryColor: Colors.green[100],
      fontFamily: 'Raleway',
    ),
    home: BackdropScaffold(
      subHeader: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Area'),
      ),
      appBar: BackdropAppBar(
        centerTitle: true,
        backgroundColor: Colors.green[100],
        title: const Text(
          'Unit Converter',
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
      frontLayer:  FormScree.onClick(title : 'Area',fromTop: false,),
      backLayer: Category.c1(const [

        'https://raw.githubusercontent.com/flutter/udacity-course/master/course/10_icons_fonts/task_10_icons_fonts/assets/icons/length.png',
        'https://raw.githubusercontent.com/flutter/udacity-course/master/course/10_icons_fonts/task_10_icons_fonts/assets/icons/area.png',
        'https://raw.githubusercontent.com/flutter/udacity-course/master/course/10_icons_fonts/task_10_icons_fonts/assets/icons/volume.png',
        'https://raw.githubusercontent.com/flutter/udacity-course/master/course/10_icons_fonts/task_10_icons_fonts/assets/icons/mass.png',
        'https://raw.githubusercontent.com/flutter/udacity-course/master/course/10_icons_fonts/task_10_icons_fonts/assets/icons/time.png',
        'https://raw.githubusercontent.com/flutter/udacity-course/master/course/10_icons_fonts/task_10_icons_fonts/assets/icons/digital_storage.png'
      ], const [
        'Length',
        'Area',
        'Volume',
        'Mass',
        'Time',
        'Digital Storage'
      ]),
    ),
  ));
}

class Category extends StatefulWidget {
  final List<String> icon;
  final List<String> titleList;
  bool isOnline=false;

  Category.c1(this.icon, this.titleList, {Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  // var status = "Offline";


  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    Background().initConnectivity(context);
    _connectivitySubscription=Background().connectivity.onConnectivityChanged.listen((event) {
     // Background().UpdateConnectionState(event, context);
      switch(event){
        case ConnectivityResult.mobile:
          setState(() {
            widget.isOnline=true;
          });

          break;
        case ConnectivityResult.wifi:
          setState(() {
            widget.isOnline=true;
          });

          break;
        case ConnectivityResult.none:
          setState(() {
            widget.isOnline=false;
          });

          break;
      }



    });


  }
  @override
  Widget build(BuildContext context) {
    var rotate = MediaQuery.of(context).size.width;

    return  Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: rotate < 600 ? _list() : _GridBuilder(),
      ),
    );

  }



/*      setState(() {
        Background.status = Background().getContinuesStatus(subscription);
        print('check status1 ${Background.status}');
         update(Background.status,context);
      });*/


  Widget _list() {
    if(widget.isOnline) {
      return ListView.builder(
        itemCount: widget.titleList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {

                Navigator.pushNamed(context, Routing.unitConverter, arguments: {
                  'title': widget.titleList[index],
                  'fromTop': true
                });

            },
            splashColor: index.isEven ? Colors.green : Colors.pinkAccent,
            highlightColor: index.isEven ? Colors.green : Colors.pinkAccent,
            borderRadius: const BorderRadius.all(Radius.circular(70.0)),
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Item.contructor(widget.icon, widget.titleList, index),
              ),
            ),
          );
        },
      );
    }
     else {
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget _GridBuilder() {
    // if (Background.status == online_status) {
    if(widget.isOnline) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
        ),
        itemCount: widget.titleList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            splashColor: index.isEven ? Colors.green : Colors.pinkAccent,
            highlightColor: index.isEven ? Colors.green : Colors.pinkAccent,
            borderRadius: const BorderRadius.all(Radius.circular(70.0)),
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Item.contructor(widget.icon, widget.titleList, index),
              ),
            ),
          );
        });
     }
    else {
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }
}

class Item extends StatefulWidget {
  final List<String> icon;
  final List<String> titleList;
  final int index;

  const Item(
      {Key? key,
      required this.icon,
      required this.titleList,
      required this.index})
      : super(key: key);

  Item.contructor(this.icon, this.titleList, this.index);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.network(
            widget.icon[widget.index],
            width: 60.0,
          ),
        ),
        Text(
          widget.titleList[widget.index],
          style: const TextStyle(fontSize: 24.0),
        ),
      ],
    );
  }
}
