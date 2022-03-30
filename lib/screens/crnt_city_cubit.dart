import 'package:bloc/bloc.dart';
import 'package:flutter_ownweather/domain/city.dart';

import 'crnt_city_state.dart';

class CrntCityCubit extends Cubit<CrntCityState> {
  CrntCityCubit(City city) : super(Success(city));
}
