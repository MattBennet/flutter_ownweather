import 'package:flutter_ownweather/utils/Http.dart';

import '../domain/city.dart';

class SplashRepository {

  Future<City> getCity(double lat, double lon) async {
    var resp = await Http.getInstance().post("weather", queryParameters: {
      "lat": lat,
      "lon": lon
    });

    return City.fromJson(resp.data);
  }
}