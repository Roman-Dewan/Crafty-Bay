class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final bool emailVerified;
  final bool phoneVerified;
  final String? avatarUrl;
  final String city;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.emailVerified,
    required this.phoneVerified,
    required this.avatarUrl,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    emailVerified: json["email_verified"],
    phoneVerified: json["phone_verified"],
    avatarUrl: json["avatar_url"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "email_verified": emailVerified,
    "phone_verified": phoneVerified,
    "avatar_url": avatarUrl,
    "city": city,
  };
}
