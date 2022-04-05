import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:firebase/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmailSignInProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isLogin = true;
  String _userEmail = ' ';
  String _userPassword = ' ';
  String _userName = ' ';
  DateTime _dateOfBirth = DateTime.now();
  String _isImage = '';
  int _age = 0;
  int _age_m = 0;
  int _age_d = 0;
  String _Rn = '';
  String _tanda = ' ';
  String _gender = ' ';
  String _dh = ' ';
  String _diagnos = ' ';
  String _race = ' ';
  String _religion = ' ';

  EmailSignInProvider() {
    _isLoading = false;
    _isLogin = true;
    _userEmail = '';
    _userPassword = '';
    _userName = '';
    _dateOfBirth = DateTime.now();
    _isImage = '';
    _age = 0;
    String _Rn = '';
    String _tanda = '';
    String _gender = ' ';
    String _dh = '';
    String _diagnos = '';
    String _race = '';
    String _religion = '';
  }
  String get isGender => _gender;

  set isGender(String value) {
    _gender = value;
    notifyListeners();
  }

  String get isdh => _dh;

  set isdh(String value) {
    _dh = value;
    notifyListeners();
  }

  String get isdiagnos => _diagnos;

  set isdiagnos(String value) {
    _diagnos = value;
    notifyListeners();
  }

  String get isbangsa => _race;

  set isbangsa(String value) {
    _race = value;
    notifyListeners();
  }

  String get isreligion => _religion;

  set isreligion(String value) {
    _religion = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set phoneNumber(String? phoneNumber) {}

  String get isImage => _isImage;

  set isImage(String value) {
    _isImage = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  String get userEmail => _userEmail;

  set userEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }

  String get userRn => _Rn;
  set userRn(String value) {
    _Rn = value;
    notifyListeners();
  }

  String get userPassword => _userPassword;

  set userPassword(String value) {
    _userPassword = value;
    notifyListeners();
  }

  String get UserNamed => _userName;

  set UserNamed(String value) {
    _userName = value;
    notifyListeners();
  }

  DateTime get dateOfBirth => _dateOfBirth;

  set dateOfBirth(DateTime value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  int get Age => _age;
  set Age(int value) {
    _age = value;
    notifyListeners();
  }

  int get Age_m => _age_m;
  set Age_m(int value) {
    _age_m = value;
    notifyListeners();
  }

  int get Age_d => _age_d;
  set Age_d(int value) {
    _age_d = value;
    notifyListeners();
  }

  String get Tanda => _tanda;
  set Tanda(String value) {
    _tanda = value;
    notifyListeners();
  }

  Future<bool> login() async {
    try {
      isLoading = true;
      final user = FirebaseAuth.instance.currentUser;

      print(userEmail);
      print(userPassword);
      print('see heredadadaasdadasddasdadasdasdsdasddasdasdasdsadasdas');
      print(UserNamed);
      //print(Image.network(isImage));

      if (isLogin) {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail,
          password: userPassword,
        );
      } else {
        registerWithEmailAndPassword(email: userEmail, password: userPassword);
      }

      isLoading = false;
      return true;
    } catch (err) {
      print(err);
      isLoading = false;
      return false;
    }
  }

  Future registerWithEmailAndPassword({
    required String email,
    required password,
    userName,
    image,
    age,
    //phoneNumber
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection("usersPatient");
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = FirebaseAuth.instance.currentUser;

      _isImage =
          'https://i.pinimg.com/originals/0c/3b/3a/0c3b3adb1a7530892e55ef36d3be6cb8.png';
      users
          .add({
            'name': UserNamed,
            'age_year': Age,
            'age_month': Age_m,
            'age_day': Age_d,
            //'year': Tanda,
            'photourl': isImage,
            'email': userEmail,
            'Rn': userRn,
            'dob': dateOfBirth,
            'gender': isGender,
            'Dominant hand': isdh,
            'Bangsa': isbangsa,
            'Agama': isreligion,
            'Diagnosis': isdiagnos,
          })
          .then((value) => print('Users Added'))
          .catchError((error) => print('Failed to add user: $error'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  /* Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': fullName, // John Doe
          'company': company, // Stokes and Sons
          'age': age // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
*/
  Future logout() async {
    FirebaseAuth.instance.signOut();
  }
}
