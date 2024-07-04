class UserModel {
  String? name ,email ,  phone , image ,token ;


UserModel({required this.name , required this.image , required this.email , required this.phone, required this.token});
UserModel.fromJson({required Map<String,dynamic>data});
}