import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Interest Calculator App',
        home: SIForm(),
        ),

      );

}

class SIForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  final _formkey=GlobalKey<FormState>();
  var   output='';
  final _currencies = ['Rupees', 'Dollars', 'Pounds'];
  final double  _minimumPadding = 5.0;
  var dropdownvalue='Rupees';
  TextEditingController tc_pi=TextEditingController();
  TextEditingController tc_roi=TextEditingController();
  TextEditingController tc_term=TextEditingController();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
//			resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
      ),

      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(
            children: <Widget>[

              getImageAsset(),

              Padding(
                  padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: tc_pi,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Principal';
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                        labelText: 'Principal',
                        hintText: 'Enter Principal e.g. 12000',

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  )),

              Padding(
                  padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                  child:
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: tc_roi,
                      validator: (String? value){
                        if(value==null ||value.isEmpty){
                          return 'Plz enter Rate of Interest amt';
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                        labelText: 'Rate of Interest',
                        hintText: 'In percent',

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  )),

              Padding(
                  padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
                  child: Row(
                    children: <Widget>[

                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: tc_term,
                      validator: (String? value){
                        if(value==null ||value.isEmpty ){
                          return 'Plz enter term amt';
                        };

                      },
                        decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Time in years',

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        ),
                      )),

                      Container(width: _minimumPadding * 5,),

                      Expanded(
                          child:
                          DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newvalue){
                          setState(() {
                             dropdownvalue = newvalue??'other';
                          });
                        },
                        value: dropdownvalue,


                      ))


                    ],
                  )),

              Padding(
                  padding: EdgeInsets.only(bottom: _minimumPadding, top: _minimumPadding),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: ElevatedButton(

                        child: Text('Calculate', textScaleFactor: 1.5,),
                        onPressed: () {
                          setState(() {
                            if(_formkey.currentState!.validate()){
                              output=      calclution();
                            }


                          });


                        },
                      ),
                    ),

                    Expanded(
                      child: ElevatedButton(

                        child: const Text('Reset', textScaleFactor: 1.5,),
                        onPressed: () {
                          reset();
                        },
                      ),
                    ),

                  ],)),

              Padding(
                padding: EdgeInsets.all(_minimumPadding * 2),
                child: Text(output,style: const TextStyle(
                  color: Colors.black
                ),),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget getImageAsset() {

    AssetImage assetImage = const AssetImage('images/flight.jpg');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0,);

    return Container(child: image, margin: EdgeInsets.all(_minimumPadding * 10),);
  }

  void reset(){
  tc_pi.text='';
  tc_roi.text='';
  tc_term.text='';

  }

  String calclution() {
    print('total amt ');
    double p=double.parse(tc_pi.text);
    double roi=double.parse(tc_roi.text);
    double terms=double.parse(tc_term.text) ;
    var result=p+roi+terms;
    print(result);
    return 'total amt $result';
  }
}
