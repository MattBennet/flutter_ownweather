import 'package:flutter/material.dart';
import 'package:flutter_ownweather/screens/location_screen.dart';
import 'package:flutter_ownweather/services/location.dart';
import 'package:flutter_ownweather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



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
    super.initState();
    getLocationData();
  }


  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();


    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }

}