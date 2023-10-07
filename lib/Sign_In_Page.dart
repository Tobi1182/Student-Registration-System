import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_record_keeping_system/Auth_Page.dart';
import 'package:student_record_keeping_system/Sign_Up_Page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  _SignInPageState createState() => _SignInPageState();
}
class _SignInPageState extends State<SignInPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _saveUserData();
  }

  void signUserIn() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );

      if(mounted){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Authpage()),
        );
      }

    } on FirebaseAuthException catch(e){
      if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
        notifyEmptyInfo();
      }
      else if(_emailController.text.isEmpty){
        notifyEmptyEmail();
      }
      else if(_passwordController.text.isEmpty){
        notifyEmptyPassword();
      }
      else if(e.code == "user-not-found"){
        notifyUserNotFound();
      }
      else if(e.code == "invalid-email"){
        notifyInvalidEmail();
      }
      else if(e.code == "wrong-password"){
        notifyInvalidPassword();
      }
    }
  }
  
    void notifyEmptyInfo(){
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
            ),
              title: const Text(
                  "Empty email and password",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              content:const Text(
                "Email and Password cannot be empty",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15.0,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text(
                      'OK',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.deepPurpleAccent
                    ),
                  ),
                ),
              ],
            );
          }
      );
    }

  void notifyEmptyEmail(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: const Text(
              "Empty email",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            content:const Text(
              "Email cannot be empty",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15.0,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.deepPurpleAccent
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  void notifyEmptyPassword(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: const Text(
              "Empty password",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            content:const Text(
              "Password cannot be empty",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15.0,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.deepPurpleAccent
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  void notifyUserNotFound(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: const Text(
              "User does not found",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            content:const Text(
              "User does not found in our database",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15.0,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.deepPurpleAccent
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  void notifyInvalidEmail(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: const Text(
              "Invalid email",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            content:const Text(
              "Your email is invalid",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15.0,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.deepPurpleAccent
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  void notifyInvalidPassword(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: const Text(
              "Invalid password",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            content:const Text(
              "Your password is invalid",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15.0,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.deepPurpleAccent
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  void _saveUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String signInSavedEmail = prefs.getString("signInSaveEmail") ?? "";
    String signInSavedPassword = prefs.getString("signInSavePassword") ?? "";

    setState(() {
      _emailController.text = signInSavedEmail;
      _passwordController.text = signInSavedPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Sign In Page",
      color: Colors.deepPurpleAccent,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign In Page",
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
            child: Container(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage("myImg/Uni_logo.png"),
                      width: 250.0,
                      height: 250.0,
                    ),
                    const Text(
                      "Welcome to",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const Text(
                      "Gusto University",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15.0),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                                Icons.mail
                            ),
                            hintText: 'Enter your email',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                                Icons.lock
                            ),
                            hintText: 'Enter your password',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          obscureText: true,
                        ),

                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox
                          (
                          width: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.deepPurpleAccent,
                              padding: const EdgeInsets.all(20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: const Text(
                                'Sign In',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15.0,
                              ),
                            ),
                            onPressed: () async{
                                signUserIn();
                                String email = _emailController.text;
                                String password = _passwordController.text;
                                SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                prefs.setString("signInSaveEmail", email);
                                prefs.setString('signInSavePassword', password);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn't have an account?",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUpPage()),
                                );
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              ),
             ),
            ),
          ),
        ),
      ),
    );
  }
}
