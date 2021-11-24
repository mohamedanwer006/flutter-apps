class Month {
  int? number;
  String? en;

  Month({this.number, this.en});

  @override
  String toString() => 'Month(number: $number, en: $en)';

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        number: json['number'] as int?,
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'en': en,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Month && other.number == number && other.en == en;
  }

  @override
  int get hashCode => number.hashCode ^ en.hashCode;
}
