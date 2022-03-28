import 'package:flutter_ownweather/domain/city.dart';

abstract class CrntCityState {}

class Success extends CrntCityState {
  City city;
  Success(this.city);


}
class Loading extends CrntCityState {}

class Error extends CrntCityState {
  String message;

  Error(this.message);
}