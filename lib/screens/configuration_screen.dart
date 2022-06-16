import 'package:calculatoor/screens/home_screen.dart';
import'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget{
  const MyApp2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tip's configuration",
      theme: ThemeData(
        // primarySwatch: Colors.white,
      ),
      home: const HomeScreen(title: 'Tip calculator'),
    );
  }
}

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeScreen> createState() => DataBase();
}

class DataBase extends State<HomeScreen> {
  final controllerPercent = TextEditingController();
  double tip = 0;

  void setDefaultValues(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('percent', value);
  } 
  Future<double?> getDefaultValues() async {
   final prefs = await SharedPreferences.getInstance();
   final double percent = prefs.getDouble('percent')?? 15;

   return percent;

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tip calculator'),
          backgroundColor: Colors.black87,
          leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
            });
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          }, 
        ),
          ),
          body: Column(
            children: [
              const Text('Percent'),
              TextFormField(
                controller: controllerPercent,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: 'Enter percent %'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    double percent = double.parse(controllerPercent.text);
                    setDefaultValues(percent);
                  });
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
                child: const Text('Save the percent'),
              )
            ],
          ),
        ),
    );
  }
}