class UserModel {
  String? name ,email ,  phone , image ,token ;


UserModel({required this.name , required this.image , required this.email , required this.phone, required this.token});
UserModel.fromJson({required Map<String,dynamic>data}){
  name = data['name'];
  email = data['email'];
  phone = data['phone'];
  image = data['image'];
  token = data['token'];


}
Map<String,dynamic> toMap(){
  return {
    'name' : name ,
   'email' :email,
  'phone':phone,
  'image':image,
 'token' :token,
  };
}

}