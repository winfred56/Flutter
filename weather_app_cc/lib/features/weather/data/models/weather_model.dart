import 'package:weather_app_cc/features/weather/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity{
  WeatherModel({
    required super.coord, required super.main, required super.base,
    required super.clouds, required super.cod, required super.dt,
    required super.sys, required super.id, required super.name,
    required super.timezone, required super.visibility, required super.weather,
    required super.wind
  });

  factory WeatherModel.fromJson (Map<String, dynamic> json) {
    return WeatherModel(
        coord: Coord.fromJson(json['coord']),
        //     if (json['weather'] != null) {
        //   weather = <Weather>[];
        //   json['weather'].forEach((v) {
        //     weather!.add(new Weather.fromJson(v));
        //   });
        // },
        main: Main.fromJson(json['main']),
        base: json['base'],
        clouds: Clouds.fromJson(json['clouds']),
        cod: json['cod'],
        dt: json['dt'],
        sys: Sys.fromJson(json['sys']),
        id: json['id'],
        name: json['name'],
        timezone: json['timezone'],
        visibility: json['visibility'],
        weather: json['weather'],
        wind: Wind.fromJson(json['wind'])
    );
  }
  //   coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
  //   if (json['weather'] != null) {
  //     weather = <Weather>[];
  //     json['weather'].forEach((v) {
  //       weather!.add(new Weather.fromJson(v));
  //     });
  //   }
  //   base = json['base'];
  //   main = json['main'] != null ? new Main.fromJson(json['main']) : null;
  //   visibility = json['visibility'];
  //   wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
  //   clouds =
  //   json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
  //   dt = json['dt'];
  //   sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
  //   timezone = json['timezone'];
  //   id = json['id'];
  //   name = json['name'];
  //   cod = json['cod'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}


class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}


/// Class [Weather]
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}


/// Class [Main]
class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main(
      {this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
        this.seaLevel,
        this.grndLevel});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }
}


/// Class [Wind]
class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}


/// Class [Clouds]
class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

/// Class [Sys]
class Sys {
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}