
import 'package:flutter_ownweather/domain/city.dart';

abstract class SplashState {}

class Success extends SplashState {
  City city;
  Success(this.city);


}
class Loading extends SplashState {}

class Error extends SplashState {
  String message;

  Error(this.message);
}