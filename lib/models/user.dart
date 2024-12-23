class User {
  int? id;
  String? name;
  String? email;
  String? created_at;
  String? updated_at;

  User({this.id, this.name, this.email, this.created_at, this.updated_at});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        // items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "created_at": created_at,
        "updated_at": updated_at,

        //"items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
