import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => __MyHomePageState();
}

class __MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String temp =
      '0'; //psuedo output, we keep this in memory and later assign it as num1, num2, or as decimal value.
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  

  Widget buildbutton(String buttonValue, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: OutlinedButton(
        onPressed: () {              // whenever the button is pressed the state changes, so we put a setState() function and inside that we put all the changes. so whenever changes happen, widget is rebuilt and change is displayed.
          setState(() {
          if (buttonValue == 'AC') {
              temp = '0';
              num1 = 0;
              num2 = 0;
              operand = "";
            } else if (buttonValue == '+' ||
                buttonValue == '-' ||
                buttonValue == 'x' ||
                buttonValue == '/' ||
                buttonValue == '%') {
              num1 = double.parse(output);
              operand = buttonValue;
              temp = '0';
            } else if (buttonValue == '.') {
              if (temp.contains('.')) {
                print("already contains a decimal"); // if the number already contains a decimal, we print this.
                return;
              } else {
                temp = temp + buttonValue; //we are adding a decimal point to the number we have at hand
              }
            } else if (buttonValue == "=") {
              num2 = double.parse(output);

              if (operand == '+') {
                temp = (num1 + num2).toString();
              } else if (operand == '-') {
                temp = (num1 - num2).toString();
              } else if (operand == 'x') {
                temp = (num1 * num2).toString();
              } else if (operand == '/') {
                temp = (num1 / num2).toString();
              } else if (operand == '%') {
                temp = (num1 % num2).toString();
              }

              num1 = 0;
              num2 = 0;
              operand = "";
            
            } else {
              temp = temp + buttonValue;
            }

            print(temp);
            setState(() {
              output = double.parse(temp).toStringAsFixed(2);  // temp will contain many zeroes, so we make it into a double and allow only two decimals, then we make it back into string.
            });
          
         });
        },
        
        child: Container(
          child: Text(
            buttonValue,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.all(30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
          child: Column(
        children: [
          

          Expanded(
            child: new Divider(),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 12.5),
            child: new Text(
              output,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  buildbutton("AC", 2),
                  buildbutton("%", 1),
                  buildbutton("/", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("7", 1),
                  buildbutton("8", 1),
                  buildbutton("9", 1),
                  buildbutton("x", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("4", 1),
                  buildbutton("5", 1),
                  buildbutton("6", 1),
                  buildbutton("-", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("1", 1),
                  buildbutton("2", 1),
                  buildbutton("3", 1),
                  buildbutton("+", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("0", 1),
                  buildbutton(".", 1),
                  buildbutton("=", 2),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
