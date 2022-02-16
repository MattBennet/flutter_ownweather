import 'package:flutter_ownweather/utils/Http.dart';

import '../domain/city.dart';

class SplashRepository {

  Future<City> getCity(int lat, int lon) async {
    var resp = await Http.getInstance().post("weather", data: {
      "lat": lat,
      "lon": lon
    });

    return City.fromJson(resp.data);
  }
}