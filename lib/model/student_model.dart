class StudentModel{
  String ?uid;
  String ?username;
  String? email;
  String ?age;
  String ?phone;
  String ?password;
StudentModel({this.uid,this.username,this.email,this.age,this.phone,this.password});

Map<String,dynamic>toMap(){
  return{
    'uid':uid,
    'username':username,
    'email':email,
    'age':age,
    'phone':phone,
    'password':password
  };
}

factory StudentModel.fromMap(Map<String,dynamic>data){
  return StudentModel(
    uid: data['uid'],
    username: data['username'],
    email: data['email'],
    age: data['age'],
    phone: data['age'],
    password: data['password'],
  );
}

}