// To parse this JSON data, do
//
//     final surahs = surahsFromJson(jsonString);

import 'dart:convert';

Surahs surahsFromJson(String str) => Surahs.fromMap(json.decode(str));

String surahsToJson(Surahs data) => json.encode(data.toMap());

class Surahs {
    int number;
    String name;
    String englishName;
    String englishNameTranslation;
    String revelationType;
    List<Ayah> ayahs;

    Surahs({
        this.number,
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.revelationType,
        this.ayahs,
    });

    factory Surahs.fromMap(Map<String, dynamic> json) => Surahs(
        number: json["number"] == null ? null : json["number"],
        name: json["name"] == null ? null : json["name"],
        englishName: json["englishName"] == null ? null : json["englishName"],
        englishNameTranslation: json["englishNameTranslation"] == null ? null : json["englishNameTranslation"],
        revelationType: json["revelationType"] == null ? null : json["revelationType"],
        ayahs: json["ayahs"] == null ? null : List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "number": number == null ? null : number,
        "name": name == null ? null : name,
        "englishName": englishName == null ? null : englishName,
        "englishNameTranslation": englishNameTranslation == null ? null : englishNameTranslation,
        "revelationType": revelationType == null ? null : revelationType,
        "ayahs": ayahs == null ? null : List<dynamic>.from(ayahs.map((x) => x.toMap())),
    };
}

class Ayah {
    int number;
    String text;
    int numberInSurah;
    int juz;
    int manzil;
    int page;
    int ruku;
    int hizbQuarter;
    bool sajda;

    Ayah({
        this.number,
        this.text,
        this.numberInSurah,
        this.juz,
        this.manzil,
        this.page,
        this.ruku,
        this.hizbQuarter,
        this.sajda,
    });

    factory Ayah.fromMap(Map<String, dynamic> json) => Ayah(
        number: json["number"] == null ? null : json["number"],
        text: json["text"] == null ? null : json["text"],
        numberInSurah: json["numberInSurah"] == null ? null : json["numberInSurah"],
        juz: json["juz"] == null ? null : json["juz"],
        manzil: json["manzil"] == null ? null : json["manzil"],
        page: json["page"] == null ? null : json["page"],
        ruku: json["ruku"] == null ? null : json["ruku"],
        hizbQuarter: json["hizbQuarter"] == null ? null : json["hizbQuarter"],
        sajda: json["sajda"] == null ? null : json["sajda"],
    );

    Map<String, dynamic> toMap() => {
        "number": number == null ? null : number,
        "text": text == null ? null : text,
        "numberInSurah": numberInSurah == null ? null : numberInSurah,
        "juz": juz == null ? null : juz,
        "manzil": manzil == null ? null : manzil,
        "page": page == null ? null : page,
        "ruku": ruku == null ? null : ruku,
        "hizbQuarter": hizbQuarter == null ? null : hizbQuarter,
        "sajda": sajda == null ? null : sajda,
    };
}
