class UserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      image: data['image'],
      token: data['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'token': token,
    };
  }
}
