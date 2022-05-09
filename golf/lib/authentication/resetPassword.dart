import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({Key? key}) : super(key: key);

  @override
  State<resetPassword> createState() => _resetPassword();
}

class _resetPassword extends State<resetPassword> {
  final _emailcontroller = TextEditingController();

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content:
                  Text('Password reset link sent! Please check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        centerTitle: true,
        backgroundColor: Color(0XFF40E0D0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter your email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: passwordReset,
            child: Text('Reset Password'),
            color: Color(0XFF40E0D0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
