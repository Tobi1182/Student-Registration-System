import 'package:flutter/material.dart';
import 'package:student_record_keeping_system/Sign_In_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}

class LandingScreen extends StatelessWidget{
  const LandingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Landing Page",
      color: Colors.deepPurpleAccent,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              "Landing Page",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Image(
                    image: AssetImage("myImg/Uni_logo.png"),
                    width: 250.0,
                    height: 250.0,
                  ),
                  const Text(
                    "Effortless Record",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const Text(
                      "Management Elevate",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const Text(
                      "Your Academic",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const Text(
                      "Journey",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  SizedBox(
                    width: 300,
                    child:   ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepPurpleAccent,
                          padding: const EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInPage()),
                          );
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15.0,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
