
abstract class SplashState {}

class Success extends SplashState {}
class Loading extends SplashState {}

class Error extends SplashState {
  String message;

  Error(this.message);
}