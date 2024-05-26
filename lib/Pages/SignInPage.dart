import 'package:flutter/material.dart';
import 'package:todomate/Pages/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'HomePage.dart';
import 'PhoneAuth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  var emailtext = TextEditingController();
  var password = TextEditingController();
  bool circular = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff003366),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 11,
              ),
              InkWell( onTap: () {Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => const PhoneAuth()),
                      (route) => false);},
                  child: buttonItem("assets/images/call.png", "Continue with Mobile", 10)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Text("or",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20)),
                ),
              ),
              textForm1(emailtext,false),
              const SizedBox(
                height: 7,
              ),
              textForm2(password,true),
              const SizedBox(
                height: 11,
              ),
              colorbutton(),
              const SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "If you don't have an account?",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (builder) => const SignUpPage()),
                          (route) => false);
                    },
                    child: const Text(
                      " SignUp",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonItem(String imagepath, String buttonname, double size) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 70,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(imagepath),
              height: 45,
              width: 45,
            ),
            const SizedBox(width: 10),
            Text(
              buttonname,
              style: const TextStyle(
                  fontSize: 19,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget textForm1(TextEditingController controller,bool obscuretext) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 70,
      child: TextFormField(
          style: const TextStyle(color: Colors.white, fontFamily: "Poppins"),
          cursorColor: Colors.lightGreen,
          controller: controller,
          obscureText: obscuretext,
          decoration: InputDecoration(
              labelText: "  Enter Email",
              labelStyle: const TextStyle(color: Colors.white),
              hintText: "abcexample@gmail.com",
              hintStyle: const TextStyle(color: Colors.grey, fontFamily: "Poppins"),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80),
                  borderSide: const BorderSide(color: Colors.blueGrey, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80),
                  borderSide: const BorderSide(color: Colors.grey, width: 2)))),
    );
  }

  Widget textForm2(TextEditingController controller,bool obscuretext) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 70,
      child: TextFormField(
        style: const TextStyle(color: Colors.white, fontFamily: "Poppins"),
        cursorColor: Colors.lightGreen,
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
            labelText: "  Enter password",
            labelStyle: const TextStyle(color: Colors.white),
            hintText: "abc@123",
            hintStyle: const TextStyle(color: Colors.grey, fontFamily: "Poppins"),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide: const BorderSide(color: Colors.blueGrey, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
            )),
      ),
    );
  }

  Widget colorbutton() {
    return InkWell(
      onTap: () async {
        setState(() {
          circular = true;
        });
        try {
          firebase_auth.UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: emailtext.text, password: password.text);
          print(userCredential.user?.email);
          setState(() {
            circular = false;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => HomePage()),
                  (route) => false);
        } catch (e) {
          final snackBar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
          height: 65,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient:
                const LinearGradient(colors: [Colors.blueAccent, Colors.purple]),
          ),
          child: Center(
              child: circular?const CircularProgressIndicator(color: Colors.black,):
              const Text(
            "Sign In",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),
          ))),
    );
  }
}
