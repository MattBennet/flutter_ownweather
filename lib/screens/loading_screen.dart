import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ownweather/services/location.dart';
import 'package:http/http.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }


  void getLocation()async{
    Location location = Location();
    await location.getCurrentLocation();

     print(location.longitude);
     print(location.latitude);
  }

  Response response()async{

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
    );
  }
}