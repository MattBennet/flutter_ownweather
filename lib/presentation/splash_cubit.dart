import 'package:bloc/bloc.dart';
import 'package:flutter_ownweather/core/exeptions.dart';
import 'package:flutter_ownweather/data/splash_repository.dart';
import 'package:flutter_ownweather/presentation/splash_state.dart';
import 'package:flutter_ownweather/utils/strings.dart';

class SplashCubit extends Cubit<SplashState> {
  var repo = SplashRepository();

  SplashCubit() : super(Loading());

  void getCity() async {
    emit(Loading());
    try {
      var resp = await repo.getCity(lat, lon);

      emit(Success());
    } catch (e, stacktrace) {
      print(stacktrace);
      switch (e.runtimeType) {
        case ServerInternal:
          emit(Error(Strings.serverInternalError));
          break;
        case NoInternetConnection:
          emit(Error(Strings.noInternetError));
          break;
        default:
          emit(Error(e.toString()));
          break;
      }
    }
  }
}