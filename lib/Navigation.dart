import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_interest/FromScreen.dart';

class Routing {
  static const String unit = '/';
  static const String unitConverter = '/unitConverter';



  static Route<dynamic> generateRoute(RouteSettings settings) {
    var valuePassed;
    if(settings.arguments!=null){
      valuePassed=settings.arguments  as  Map<String,dynamic>;
    }

    switch (settings.name) {
     /* case product:
        return MaterialPageRoute(
          builder: (context) {
            return PostsPage();
          },
        );*/


      case unitConverter:
        return MaterialPageRoute(
          builder: (context) {
            return FormScree.onClick(title: valuePassed['title'],fromTop: valuePassed['fromTop'],);
          },
        );

      default:
        throw 'no screen';
    }
  }
}