import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/backendData.dart';
import 'package:weatherapp/weatherModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'WeatherApp'),
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
  var description;

  TextEditingController _textcontroller= TextEditingController();
  weatherModel?weathermodel;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:
      Column(
        children: [
          SizedBox(height: 25,),
          Container(

            width: 300,
            height: 300,
            child: Column(
            children: [

            TextField(

            decoration: InputDecoration(
              hintText: 'enter your city',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
            ),

            controller: _textcontroller,
          ),

          SizedBox(height: 30,),

          ElevatedButton(onPressed: ()async{
            weathermodel=await backendData().getWeather(_textcontroller.text);
            setState(() {

            });
          },
              child: Text("Search")),

          SizedBox(height: 30,),

          Container(

              width:100,
              height: 60,
              color: Colors.greenAccent,
              child: Expanded(child: Center(child: Text(" ${weathermodel?.name?.toString()}")))),

        ],
      ),
      ),

       Expanded(child: Padding(
       padding: EdgeInsets.all(20),
       child: ListView(
       children: [

       ListTile(
        leading: Icon(Icons.thermostat_outlined),
        title: Text("Temperature"),
        trailing: Text(" ${weathermodel?.main?.temp} kelvin"),),

        ListTile(
        leading: Icon(Icons.cloud),
        title: Text("Pressure"),
          trailing: Text(" ${weathermodel?.main?.pressure}"),),

         ListTile(
           leading: Icon(Icons.sunny),
           title: Text("Humidity"),
           trailing: Text(" ${weathermodel?.main?.humidity}%"),),

         ListTile(
           leading: Icon(Icons.wind_power),
           title: Text("wind speed"),
           trailing: Text(" ${weathermodel?.wind?.speed}mph"),),

       ],
       ),
       ),
       )
    ],
    ),
    );
  }
}
