final hai = 'Welcome';
final urlImage = 'assets/golf_ball.jpg';
final Fname = '';
final email = '';

class UserModel {
  String? uid;
  String? email;
  String? Fname;
  String? Sname;
  String? address;
  String? phoneNumber;
  String? profileImage;

  UserModel(
      {this.uid,
      this.email,
      this.Fname,
      this.Sname,
      this.address,
      this.phoneNumber,
      this.profileImage});

  //fetch data from server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      Fname: map['First name'],
      Sname: map['Second name'],
      address: map['Address'],
      phoneNumber: map['Phone Number'],
      profileImage: map['profileImage'],
    );
  }
  //send data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'First name': Fname,
      'Second name': Sname,
      'Address': address,
      'Phone number': phoneNumber,
      'profileImage': profileImage,
    };
  }
}
