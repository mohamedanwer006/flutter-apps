class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
  });

  @override
  String toString() {
    return 'Timings(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, sunset: $sunset, maghrib: $maghrib, isha: $isha, imsak: $imsak, midnight: $midnight)';
  }

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json['Fajr'] as String?,
        sunrise: json['Sunrise'] as String?,
        dhuhr: json['Dhuhr'] as String?,
        asr: json['Asr'] as String?,
        sunset: json['Sunset'] as String?,
        maghrib: json['Maghrib'] as String?,
        isha: json['Isha'] as String?,
        imsak: json['Imsak'] as String?,
        midnight: json['Midnight'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Sunset': sunset,
        'Maghrib': maghrib,
        'Isha': isha,
        'Imsak': imsak,
        'Midnight': midnight,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Timings &&
        other.fajr == fajr &&
        other.sunrise == sunrise &&
        other.dhuhr == dhuhr &&
        other.asr == asr &&
        other.sunset == sunset &&
        other.maghrib == maghrib &&
        other.isha == isha &&
        other.imsak == imsak &&
        other.midnight == midnight;
  }

  @override
  int get hashCode =>
      fajr.hashCode ^
      sunrise.hashCode ^
      dhuhr.hashCode ^
      asr.hashCode ^
      sunset.hashCode ^
      maghrib.hashCode ^
      isha.hashCode ^
      imsak.hashCode ^
      midnight.hashCode;
}
