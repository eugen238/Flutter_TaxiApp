import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:users_app/authentication/login_screen.dart';
import 'package:users_app/global/global_var.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    retrieveCurrentUserInfo();
    setUserInfo();
  }

  void setUserInfo() {
    nameController.text = userName;
    phoneController.text = userPhone;
    emailController.text = FirebaseAuth.instance.currentUser!.email.toString();
  }

  // Получаем данные пользователя из базы данных и отображаем их на странице
  void retrieveCurrentUserInfo() async {
    await FirebaseDatabase.instance.ref()
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .once().then((snap)
    {
      userName = (snap.snapshot.value as Map)["name"];
      userPhone = (snap.snapshot.value as Map)["phone"];
      userEmail = (snap.snapshot.value as Map)["email"];
    });
  }

  // Обновляем данные пользователя в базе данных
  void _saveUserData() {
    DatabaseReference _userRef = FirebaseDatabase.instance.ref().child("users").child(FirebaseAuth.instance.currentUser!.uid);
    _userRef.update({
      'name': nameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Changes saved')));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to save changes')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: _saveUserData,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
      ),
    );
  }
}
