class Weekday {
  String? en;
  String? ar;

  Weekday({this.en, this.ar});

  @override
  String toString() => 'Weekday(en: $en, ar: $ar)';

  factory Weekday.fromJson(Map<String, dynamic> json) => Weekday(
        en: json['en'] as String?,
        ar: json['ar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'ar': ar,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weekday && other.en == en && other.ar == ar;
  }

  @override
  int get hashCode => en.hashCode ^ ar.hashCode;
}
