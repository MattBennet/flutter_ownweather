import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ownweather/services/location.dart';
import 'package:http/http.dart' as http;



const apiKey = '162e170585631b027f9a67c8ebd53852';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  double latitude;
  double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();

  }


  void getLocation()async{
    Location location = Location();
    await location.getCurrentLocation();

     longitude = location.longitude;
     latitude = location.latitude;

    getData();
  }

  void getData() async{
    http.Response response =await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));

    if(response.statusCode == 200){
      String data = response.body;

      var decoderData = jsonDecode(data);
      var cityName = decoderData['name'];
      var temperature = decoderData['main']['temp'] ;
      var weatherDes = decoderData['weather'][0]['description'];

      print ( [cityName, temperature , weatherDes] );

    }else{
      print (response.statusCode);
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
    );
  }
}
