import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_record_keeping_system/Home_Page.dart';
import 'package:student_record_keeping_system/Sign_In_Page.dart';

class Authpage extends StatelessWidget{
  const Authpage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const HomePage();
          }
          else{
            return const SignInPage();
          }
        },
      ),
    );
  }
}