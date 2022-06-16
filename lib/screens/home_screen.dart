import'package:flutter/material.dart';
import 'package:calculatoor/screens/configuration_screen.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen>{
  final controllerAmount = TextEditingController();
  final controllerPercent = TextEditingController();
  double tip = 0;

  @override 
  Widget build(BuildContext context) {
    ThemeData.dark();
    DataBase per= DataBase();

    per.getDefaultValues().then((value) => {
      controllerPercent.text = value.toString()
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tips"),
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            setState(() {
            });
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const MyApp2()),
            );
          }, 
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: TextFormField(
                controller: controllerAmount,
                decoration: const InputDecoration(
                  labelText: "Amount",
                  border: UnderlineInputBorder()
                ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: TextFormField(
                controller: controllerPercent,
                decoration: const InputDecoration(
                  labelText: "Percent",
                  border: UnderlineInputBorder()
                ),
              ),
            ),
            Text("Tip to pay \$$tip"),
            ElevatedButton(
              // style: style,
              onPressed: () {
                setState(() {
                  double amount = double.parse(controllerAmount.text);
                  double percent = double.parse(controllerPercent.text);
                  tip = amount * percent / 100;
                  per.setDefaultValues(percent);
                });
              }, 
              child: const Text("Calculate")
            ),
          ],
        ),
      ),
    backgroundColor: Colors.greenAccent,
    );
  }
}

// {}