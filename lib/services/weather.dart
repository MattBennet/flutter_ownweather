class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
  String getImage(int condition){
    if (condition < 300) {
      return '11d';
    } else if (condition < 400) {
      return '09d';
    } else if (condition < 505) {
      return '10d️';
    } else if (condition < 505) {
      return '10d️';
    }else if (condition < 512) {
      return '13d️';
    }else if (condition < 600) {
      return '09d️';
    } else if (condition < 700) {
      return '13d';
    } else if (condition < 800) {
      return '50d️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }

  }
}
