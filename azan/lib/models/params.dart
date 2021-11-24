class Params {
  double? fajr;
  double? isha;

  Params({this.fajr, this.isha});

  @override
  String toString() => 'Params(fajr: $fajr, isha: $isha)';

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        fajr: json['Fajr'] as double?,
        isha: json['Isha'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Isha': isha,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Params && other.fajr == fajr && other.isha == isha;
  }

  @override
  int get hashCode => fajr.hashCode ^ isha.hashCode;
}
