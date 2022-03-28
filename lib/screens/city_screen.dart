import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ownweather/domain/city.dart';
import 'package:flutter_ownweather/presentation/splash_cubit.dart';
import 'package:flutter_ownweather/screens/crnt_city_cubit.dart';
import 'package:flutter_ownweather/screens/crnt_city_state.dart';
import 'package:flutter_ownweather/services/weather.dart';
import 'package:flutter_ownweather/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  WeatherModel weather = WeatherModel();
  @override
  State<StatefulWidget> createState() => _State();

  CityScreen._();

  static Widget newInstance(City city) {
    return BlocProvider(
      create: (_) => CrntCityCubit(city),
      child: CityScreen._(),
    );
  }
}

class _State extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: BlocBuilder<CrntCityCubit, CrntCityState>(
            builder: (ctx, state) {
              if(state is Success) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.near_me,
                            size: 50.0,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.location_city,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${state.city.main.temp}°',
                            style: kTempTextStyle,
                          ),
                          Text(
                          widget.weather.getWeatherIcon(state.city.weather[0].id),
                            style: kConditionTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        "It's ${state.city.weather[0].description} in ${state.city.name} now!",
                        textAlign: TextAlign.right,
                        style: kMessageTextStyle,
                      ),
                    ),
                  ],
                );
              }
               return Container();

            }

          ),
        ),
      ),
    );
  }
}
