// To parse this JSON data, do
//
//     final userPaginationModel = userPaginationModelFromJson(jsonString);

import 'dart:convert';


UserPaginationModel userPaginationModelFromJson(String str) => UserPaginationModel.fromJson(json.decode(str));

String userPaginationModelToJson(UserPaginationModel data) => json.encode(data.toJson());

class UserPaginationModel {
    int? page;
    int? perPage;
    int? total;
    int? totalPages;
    List<User>? data;
    Support? support;

    UserPaginationModel({
         this.page,
         this.perPage,
         this.total,
         this.totalPages,
         this.data,
         this.support,
    });
factory UserPaginationModel.fromRawJson(String str) {
  var decodedJson = json.decode(str);
  return UserPaginationModel.fromJson(decodedJson);
}

    factory UserPaginationModel.fromJson(Map<String, dynamic> json) => UserPaginationModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support?.toJson(),
    };
}

class User {
    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    User({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    String url;
    String text;

    Support({
        required this.url,
        required this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
