import 'package:flutter/material.dart';
import 'package:light_height_ecomerce_app/components/reusedcomponents.dart';
import 'package:light_height_ecomerce_app/presentation/views/app.dart';
import 'package:light_height_ecomerce_app/utils/heightUtils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizeUtils.sizedboxHeight(100),
            Image.asset("assets/people.png"),
            SizeUtils.sizedboxHeight(20),
            const Text(
              "Login Account",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Text(
              "Create Account for your app lor  Account for your app lore",
              textAlign: TextAlign.center,
            ),
            SizeUtils.sizedboxHeight(30),
            InputField(
              hintText: 'Email',
              controller: _email,
            ),
            SizeUtils.sizedboxHeight(20),
            InputField(
              hintText: 'Password',
              controller: _password,
            ),
            SizeUtils.sizedboxHeight(20),
            ElevatedButton(
                onPressed: signup,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 10, 179, 240)),
                child: Container(
                  width: 300,
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            SizeUtils.sizedboxHeight(20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Don't Have an Account"),
                InkWell(
                    child:  Text(
                  "Signup",
                  style: TextStyle(color: Colors.blue),
                ))
              ],
            )
          ],
        ),
      )),
    );
  }

  void signup() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => App()),
    );
  }
}
