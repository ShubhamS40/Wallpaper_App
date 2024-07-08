import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AdminPage());
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 247, 234, 234),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              padding: EdgeInsets.only(top: 45, left: 20, right: 20),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Color.fromARGB(255, 21, 19, 19)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(MediaQuery.of(context).size.width, 150),
                ),
              ),
            ),
            Container(
              child: Form(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          "Let's start with \n Admin",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 350,
                          margin: EdgeInsets.only(left: 12, right: 12, bottom: 10, top: 10),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Username",
                                    ),
                                    controller: username,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                    ),
                                    controller: password,
                                  ),
                                ),
                                SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () async {
                                    try {
                                      await FirebaseFirestore.instance.collection('user').add({
                                        'username': username.text,
                                        'password': password.text,
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Data sent to Firebase')),
                                      );
                                    } catch (e) {
                                      String errorMessage = 'Failed to send data';
                                      if (e is FirebaseException) {
                                        errorMessage = e.message!;
                                      }
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(errorMessage)),
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
