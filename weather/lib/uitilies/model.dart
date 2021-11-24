// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) {
  final jsonData = json.decode(str);
  return Weather.fromJson(jsonData);
}

String weatherToJson(Weather data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Weather {
  double latitude;
  double longitude;
  String timezone;
  Currently currently;
  Hourly hourly;
  Daily daily;
  Flags flags;
  int offset;

  Weather({
    this.latitude,
    this.longitude,
    this.timezone,
    this.currently,
    this.hourly,
    this.daily,
    this.flags,
    this.offset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => new Weather(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    timezone: json["timezone"],
    currently: Currently.fromJson(json["currently"]),
    hourly: Hourly.fromJson(json["hourly"]),
    daily: Daily.fromJson(json["daily"]),
    flags: Flags.fromJson(json["flags"]),
    offset: json["offset"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "timezone": timezone,
    "currently": currently.toJson(),
    "hourly": hourly.toJson(),
    "daily": daily.toJson(),
    "flags": flags.toJson(),
    "offset": offset,
  };
}

class Currently {
  int time;
  String summary;
  String icon;
  var precipIntensity;//was int
  var precipProbability;//was int
  double temperature;
  double apparentTemperature;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  int windBearing;
  double cloudCover;
  int uvIndex;
  double visibility;
  double ozone;

  Currently({
    this.time,
    this.summary,
    this.icon,
    this.precipIntensity,
    this.precipProbability,
    this.temperature,
    this.apparentTemperature,
    this.dewPoint,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.windGust,
    this.windBearing,
    this.cloudCover,
    this.uvIndex,
    this.visibility,
    this.ozone,
  });

  factory Currently.fromJson(Map<String, dynamic> json) => new Currently(
    time: json["time"],
    summary: json["summary"],
    icon: json["icon"],
    precipIntensity: json["precipIntensity"],
    precipProbability: json["precipProbability"],
    temperature: json["temperature"].toDouble(),
    apparentTemperature: json["apparentTemperature"].toDouble(),
    dewPoint: json["dewPoint"].toDouble(),
    humidity: json["humidity"].toDouble(),
    pressure: json["pressure"].toDouble(),
    windSpeed: json["windSpeed"].toDouble(),
    windGust: json["windGust"].toDouble(),
    windBearing: json["windBearing"],
    cloudCover: json["cloudCover"].toDouble(),
    uvIndex: json["uvIndex"],
    visibility: json["visibility"].toDouble(),
    ozone: json["ozone"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "summary": summary,
    "icon": icon,
    "precipIntensity": precipIntensity,
    "precipProbability": precipProbability,
    "temperature": temperature,
    "apparentTemperature": apparentTemperature,
    "dewPoint": dewPoint,
    "humidity": humidity,
    "pressure": pressure,
    "windSpeed": windSpeed,
    "windGust": windGust,
    "windBearing": windBearing,
    "cloudCover": cloudCover,
    "uvIndex": uvIndex,
    "visibility": visibility,
    "ozone": ozone,
  };
}

class Daily {
  String summary;
  String icon;
  List<Datum> data;

  Daily({
    this.summary,
    this.icon,
    this.data,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => new Daily(
    summary: json["summary"],
    icon: json["icon"],
    data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary,
    "icon": icon,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int time;
  String summary;
  String icon;
  int sunriseTime;
  int sunsetTime;
  double moonPhase;
  double precipIntensity;
  double precipIntensityMax;
  int precipIntensityMaxTime;
  double precipProbability;
  double temperatureHigh;
  int temperatureHighTime;
  double temperatureLow;
  int temperatureLowTime;
  double apparentTemperatureHigh;
  int apparentTemperatureHighTime;
  double apparentTemperatureLow;
  int apparentTemperatureLowTime;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  int windGustTime;
  int windBearing;
  double cloudCover;
  int uvIndex;
  int uvIndexTime;
  double visibility;
  double ozone;
  double temperatureMin;
  int temperatureMinTime;
  double temperatureMax;
  int temperatureMaxTime;
  double apparentTemperatureMin;
  int apparentTemperatureMinTime;
  double apparentTemperatureMax;
  int apparentTemperatureMaxTime;
  String precipType;

  Datum({
    this.time,
    this.summary,
    this.icon,
    this.sunriseTime,
    this.sunsetTime,
    this.moonPhase,
    this.precipIntensity,
    this.precipIntensityMax,
    this.precipIntensityMaxTime,
    this.precipProbability,
    this.temperatureHigh,
    this.temperatureHighTime,
    this.temperatureLow,
    this.temperatureLowTime,
    this.apparentTemperatureHigh,
    this.apparentTemperatureHighTime,
    this.apparentTemperatureLow,
    this.apparentTemperatureLowTime,
    this.dewPoint,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.windGust,
    this.windGustTime,
    this.windBearing,
    this.cloudCover,
    this.uvIndex,
    this.uvIndexTime,
    this.visibility,
    this.ozone,
    this.temperatureMin,
    this.temperatureMinTime,
    this.temperatureMax,
    this.temperatureMaxTime,
    this.apparentTemperatureMin,
    this.apparentTemperatureMinTime,
    this.apparentTemperatureMax,
    this.apparentTemperatureMaxTime,
    this.precipType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
    time: json["time"],
    summary: json["summary"],
    icon: json["icon"],
    sunriseTime: json["sunriseTime"],
    sunsetTime: json["sunsetTime"],
    moonPhase: json["moonPhase"].toDouble(),
    precipIntensity: json["precipIntensity"].toDouble(),
    precipIntensityMax: json["precipIntensityMax"].toDouble(),
    precipIntensityMaxTime: json["precipIntensityMaxTime"],
    precipProbability: json["precipProbability"].toDouble(),
    temperatureHigh: json["temperatureHigh"].toDouble(),
    temperatureHighTime: json["temperatureHighTime"],
    temperatureLow: json["temperatureLow"].toDouble(),
    temperatureLowTime: json["temperatureLowTime"],
    apparentTemperatureHigh: json["apparentTemperatureHigh"].toDouble(),
    apparentTemperatureHighTime: json["apparentTemperatureHighTime"],
    apparentTemperatureLow: json["apparentTemperatureLow"].toDouble(),
    apparentTemperatureLowTime: json["apparentTemperatureLowTime"],
    dewPoint: json["dewPoint"].toDouble(),
    humidity: json["humidity"].toDouble(),
    pressure: json["pressure"].toDouble(),
    windSpeed: json["windSpeed"].toDouble(),
    windGust: json["windGust"].toDouble(),
    windGustTime: json["windGustTime"],
    windBearing: json["windBearing"],
    cloudCover: json["cloudCover"].toDouble(),
    uvIndex: json["uvIndex"],
    uvIndexTime: json["uvIndexTime"],
    visibility: json["visibility"].toDouble(),
    ozone: json["ozone"].toDouble(),
    temperatureMin: json["temperatureMin"].toDouble(),
    temperatureMinTime: json["temperatureMinTime"],
    temperatureMax: json["temperatureMax"].toDouble(),
    temperatureMaxTime: json["temperatureMaxTime"],
    apparentTemperatureMin: json["apparentTemperatureMin"].toDouble(),
    apparentTemperatureMinTime: json["apparentTemperatureMinTime"],
    apparentTemperatureMax: json["apparentTemperatureMax"].toDouble(),
    apparentTemperatureMaxTime: json["apparentTemperatureMaxTime"],
    precipType: json["precipType"] == null ? null : json["precipType"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "summary": summary,
    "icon": icon,
    "sunriseTime": sunriseTime,
    "sunsetTime": sunsetTime,
    "moonPhase": moonPhase,
    "precipIntensity": precipIntensity,
    "precipIntensityMax": precipIntensityMax,
    "precipIntensityMaxTime": precipIntensityMaxTime,
    "precipProbability": precipProbability,
    "temperatureHigh": temperatureHigh,
    "temperatureHighTime": temperatureHighTime,
    "temperatureLow": temperatureLow,
    "temperatureLowTime": temperatureLowTime,
    "apparentTemperatureHigh": apparentTemperatureHigh,
    "apparentTemperatureHighTime": apparentTemperatureHighTime,
    "apparentTemperatureLow": apparentTemperatureLow,
    "apparentTemperatureLowTime": apparentTemperatureLowTime,
    "dewPoint": dewPoint,
    "humidity": humidity,
    "pressure": pressure,
    "windSpeed": windSpeed,
    "windGust": windGust,
    "windGustTime": windGustTime,
    "windBearing": windBearing,
    "cloudCover": cloudCover,
    "uvIndex": uvIndex,
    "uvIndexTime": uvIndexTime,
    "visibility": visibility,
    "ozone": ozone,
    "temperatureMin": temperatureMin,
    "temperatureMinTime": temperatureMinTime,
    "temperatureMax": temperatureMax,
    "temperatureMaxTime": temperatureMaxTime,
    "apparentTemperatureMin": apparentTemperatureMin,
    "apparentTemperatureMinTime": apparentTemperatureMinTime,
    "apparentTemperatureMax": apparentTemperatureMax,
    "apparentTemperatureMaxTime": apparentTemperatureMaxTime,
    "precipType": precipType == null ? null : precipType,
  };
}

class Flags {
  List<String> sources;
  double nearestStation;
  String units;

  Flags({
    this.sources,
    this.nearestStation,
    this.units,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => new Flags(
    sources: new List<String>.from(json["sources"].map((x) => x)),
    nearestStation: json["nearest-station"].toDouble(),
    units: json["units"],
  );

  Map<String, dynamic> toJson() => {
    "sources": new List<dynamic>.from(sources.map((x) => x)),
    "nearest-station": nearestStation,
    "units": units,
  };
}

class Hourly {
  String summary;
  String icon;
  List<Currently> data;

  Hourly({
    this.summary,
    this.icon,
    this.data,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => new Hourly(
    summary: json["summary"],
    icon: json["icon"],
    data: new List<Currently>.from(json["data"].map((x) => Currently.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary,
    "icon": icon,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
