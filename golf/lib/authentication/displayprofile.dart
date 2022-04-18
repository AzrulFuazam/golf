import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golf/widget/mp.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../authentication/displayprofile.dart';
import '../authentication/userModel.dart';
import '../widget/navigation_drawer.dart';
import 'package:ndialog/ndialog.dart';
//import 'package:snapshot/snapshot.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();
  //final _auth = FirebaseAuth.instance;
  final databaseRef = FirebaseFirestore.instance.collection("users");
  UserModel? userModel;
  //image upload
  File? imageFile;
  bool showLocalFile = false;

  _pickImageFromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});

    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = userModel!.email! + '.jpg';

      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName)
          .putFile(imageFile!);

      TaskSnapshot snapshot = await uploadTask;

      String profileImageUrl = await snapshot.ref.getDownloadURL();

      print(profileImageUrl);

      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();

      print(e.toString());
    }
  }

  _pickImageFromCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Profil'),
          centerTitle: true,
          backgroundColor: Color(0XFF40E0D0),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 80,
                  backgroundImage: showLocalFile
                      ? FileImage(imageFile!) as ImageProvider
                      : UserModel().profileImage == ''
                          ? const NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                          : NetworkImage('')),
              IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.image),
                                  title: const Text('From Gallery'),
                                  onTap: () {
                                    _pickImageFromGallery();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text('From Camera'),
                                  onTap: () {
                                    _pickImageFromCamera();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        });

                    StreamBuilder(
                        stream: databaseRef.snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            final data = snapshot.requireData;
                            return ListView.builder(
                                //  itemCount: snapshot.data!.docs.length,
                                itemCount: data.size,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Column(
                                      children: <Widget>[
                                        if ('${data.docs[index]['email']}' ==
                                            user!.email!)
                                          ListTile(
                                            title: Text('Name'),
                                            subtitle: Text(
                                              // snapshot.data!.docs[index]['name'], context,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold
                                              '${data.docs[index]['name']}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            trailing: Icon(Icons.edit_outlined),
                                            onTap: () {
                                              updateDialog(
                                                  snapshot.data!.docs[index]
                                                      ['name'], //
                                                  context,
                                                  snapshot.hasData);
                                            },
                                            // dense: true,
                                            // selected: true,
                                            // enabled: true,
                                          ),
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return CircularProgressIndicator();
                          }
                        });
                  })
            ],
          ),
        ),
      );

  Future<void> updateDialog(String name, BuildContext context, var key) {
    var nameController = TextEditingController(text: name);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Data"),
            content: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Name"),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    updateProfile(nameController.text, key);
                    Navigator.of(context).pop();
                  },
                  child: Text("Update")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"))
            ],
          );
        });
  }

  void updateProfile(String name, var key) {
    Map<String, String> x = {"Name": name};
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    //User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    //final databaseRef = FirebaseDatabase.instance.ref().child("users");
    firebaseFirestore.collection("users").doc(user!.uid).update({'name': name});
    Fluttertoast.showToast(
        msg: "Saved successfully :) ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
  }
}
//last




/*class profil extends StatefulWidget {
  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  File? file;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* file == null
                  ? InkWell(
                      onTap: () {
                        chooseImage();
                      },
                      child: Icon(
                        Icons.image,
                        size: 48,
                      ),
                    )
                  : Image.file(file!),*/
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: "${loggedInUser.name} ",
                    hintText: "${loggedInUser.name} ",
                    border: OutlineInputBorder()),
              ),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: "${loggedInUser.name} ",
                    //hintText: "Enter name",
                    border: OutlineInputBorder()),
              ),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: "${loggedInUser.name} ",
                    //hintText: "Enter name",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    updateProfile(context);
                  },
                  child: Text("Update profile"))
            ],
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    print("file " + xfile!.path);
    file = File(xfile.path);
    setState(() {});
  }

  updateProfile(BuildContext context) async {
    Map<String, dynamic> map = Map();
    if (file != null) {
      String url = await uploadImage();
      map['profileImage'] = url;
    }
    map['name'] = _textEditingController.text;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(map);
    Navigator.pop(context);
  }

  Future<String> uploadImage() async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(
            FirebaseAuth.instance.currentUser!.uid + "_" + basename(file!.path))
        .putFile(file!);

    return taskSnapshot.ref.getDownloadURL();
  }
}
*/