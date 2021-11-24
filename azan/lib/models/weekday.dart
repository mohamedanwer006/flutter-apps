class Weekday {
  String? en;

  Weekday({this.en});

  @override
  String toString() => 'Weekday(en: $en)';

  factory Weekday.fromJson(Map<String, dynamic> json) => Weekday(
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weekday && other.en == en;
  }

  @override
  int get hashCode => en.hashCode;
}
