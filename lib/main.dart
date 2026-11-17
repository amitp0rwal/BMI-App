import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}
class MyHomeState extends State<MyHomePage>{

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var msg = "";
  var bgColor = Colors.indigo.shade100;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("B M I APP"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
              color: bgColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("BMI",style: TextStyle(
                      fontSize: 35,
                      fontWeight:FontWeight.w500 ),),

                  SizedBox(height: 21,),

                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text("ENTER YOUR WEIGHT (in Kg's)"),
                        prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text("ENTER YOUR HEIGHT (in feet)"),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                        label: Text("ENTER YOUR HEIGHT (in inch)"),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 15,),

                  ElevatedButton(onPressed: () {
                    var wt = wtController.text;
                    var ft = ftController.text;
                    var inch = inController.text;

                    if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {

                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt*12) + iInch; //total inches
                      var tCm = tInch*2.54; //total cm
                      var tMt= tCm/100; //total meter

                      var bmi = iWt/(tMt*tMt); //final  bmi formula

                      if(bmi>25){
                        msg ="YOU ARE OVERWEIGHT";
                        bgColor = Colors.orange.shade100;
                      } else if(bmi<18){
                        msg = "YOU ARE UNDERWEIGHT";
                        bgColor = Colors.red.shade200;
                      } else if(bmi>=18 && bmi<=25) {
                        msg ="YOU ARE HEALTHY";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result = "YOUR BMI IS : ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "PLEASE FILL THE ALL REQUIRED OPTIONS.";
                        msg = '';
                      });
                    }
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(5)))
                      ),
                      child: Text("CALCULATE", style: TextStyle(fontSize: 18 ),)),
                  SizedBox(height: 20),
                  Center(child: Text(result, style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.w500),)),
                  Center(child: Text(msg, style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.w500),))
                ],
              ),
            ),
    );
  }
}