import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_pref/model/user.dart';
import 'package:shared_pref/services/shared_preference.dart';

class UserPage extends StatefulWidget {
  static const String id = "user_page";

  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var logger = Logger();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();

  String? firstName;
  String? lastName;
  String? email;
  String? password;

  Future<void> saveObj() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordNameController.text.trim();
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      User user = User(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password);
      bool isSaved =
          await SharedPrefService.saveObject(object: user, objectKey: "user");

      logger.e(isSaved.toString());
    }
  }

  Future<void> getObject() async {
    User user = await SharedPrefService.getUserObject();
    setState(() {
      firstName = user.firstName;
      lastName = user.lastName;
      email = user.email;
      password = user.password;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(hintText: 'First name'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(hintText: 'Last name'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: passwordNameController,
              decoration: const InputDecoration(hintText: 'Password '),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  saveObj();
                },
                child: Text("Save")),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  await getObject();
                },
                child: Text("Get")),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "First name:",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      firstName??"empty",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Last name:",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      lastName??"empty",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Email:",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      email??"empty",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "First name:",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      password??"empty",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
