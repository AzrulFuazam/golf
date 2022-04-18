final hai = 'Selamat Datang';
final urlImage = 'assets/golf_ball.jpg';
final name = '';
final email = '';

class UserModel {
  String? uid;
  String? email;
  String? name;
  String? profileImage;

  UserModel({this.uid, this.email, this.name, this.profileImage});

  //fetch data from server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      profileImage: map['profileImage'],
    );
  }
  //send data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'profileImage': profileImage,
    };
  }
}
