import 'dart:convert';

Sensor sensorFromJson(String str) => Sensor.fromMap(json.decode(str));

String sensorToJson(Sensor data) => json.encode(data.toMap());

class Sensor {
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    String macAddress;
    String tag;
    int version;
    num humidity_value;
    num temp_value;
    int v;
    String name;
    String email;
    String picture;
    String createdBy;

    Sensor({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.macAddress,
        this.tag,
        this.version,
        this.humidity_value,
        this.temp_value,
        this.v,
        this.name,
        this.email,
        this.picture,
        this.createdBy,
    });

    Sensor copyWith({
        String id,
        DateTime createdAt,
        DateTime updatedAt,
        String macAddress,
        String tag,
        int version,
        num humidity_value,
        num temp_value,
        int v,
        String name,
        String email,
        String picture,
        String createdBy,
    }) => 
        Sensor(
            id: id ?? this.id,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            macAddress: macAddress ?? this.macAddress,
            tag: tag ?? this.tag,
            version: version ?? this.version,
            humidity_value: humidity_value ?? this.humidity_value,
            temp_value: temp_value ?? this.temp_value,
            v: v ?? this.v,
            name: name ?? this.name,
            email: email ?? this.email,
            picture: picture ?? this.picture,
            createdBy: createdBy ?? this.createdBy,
        );

    factory Sensor.fromMap(Map<String, dynamic> json) => Sensor(
        id: json["_id"] == null ? null : json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        macAddress: json["macAddress"] == null ? null : json["macAddress"],
        tag: json["tag"] == null ? null : json["tag"],
        version: json["version"] == null ? null : json["version"],
        humidity_value: json["humidity_value"] == null ? null : json["humidity_value"],
        temp_value: json["temp_value"] == null ? null : json["temp_value"],
        v: json["__v"] == null ? null : json["__v"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        picture: json["picture"] == null ? null : json["picture"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "macAddress": macAddress == null ? null : macAddress,
        "tag": tag == null ? null : tag,
        "version": version == null ? null : version,
        "humidity_value": humidity_value == null ? null : humidity_value,
        "temp_value": temp_value == null ? null : temp_value,
        "__v": v == null ? null : v,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "picture": picture == null ? null : picture,
        "createdBy": createdBy == null ? null : createdBy,
    };
}
