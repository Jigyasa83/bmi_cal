import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text('BMI CALCULATOR',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
            )),
        body: Container(
          color: Color.fromARGB(97, 2, 16, 81),
          child: Center(
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 38,
                  ),
                  Text(
                    'Height',
                    style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter Height in Feet',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Weight',
                    style: TextStyle(
                        fontSize: 35,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter Weight in Kg',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                      height: 70,
                      width: 300,
                      child: ElevatedButton(
                          onPressed: () {
                            var ft = ftController.text.toString();
                            var wt = wtController.text.toString();

                            if (wt != "" && ft != "") {
                              var iWt = int.parse(wt);
                              var iFt = int.parse(ft);

                              var tInch = iFt * 12;

                              var tCm = tInch * 2.54;

                              var tM = tCm / 100;

                              var bmi = iWt / (tM * tM);

                              var msg = "";

                              if (bmi > 25) {
                                msg = "You are Overweight!!";
                              } else if (bmi < 18) {
                                msg = "You are Underweight";
                              } else {
                                msg = "  You are Healthy!!!";
                              }

                              setState(() {
                                result =
                                "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                              });
                            } else {
                              setState(() {
                                result =
                                "please fill all the required blanks!!";
                              });
                            }
                          },
                          child: Text('Calculate',
                              style: TextStyle(fontSize: 35)))),
                  Text(
                    result,
                    style: TextStyle(fontSize: 30),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
