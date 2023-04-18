import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/weatherModel.dart';
class backendData{

 Future getWeather(String? city)async{
    var url="https://api.openweathermap.org/data/2.5/weather?q=$city&appid=61cb701de3e4374e4b02422588c748b5";
  final res= await http.get(Uri.parse(url));
  var resbody=res.body;

  if (res.statusCode==200){
    return weatherModel.fromJson(json.decode(resbody));
  }
  throw Exception();
  }
}