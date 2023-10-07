import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_record_keeping_system/Sign_In_Page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  void signUpUserInfo() async{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Sign Up Page",
      color: Colors.deepPurpleAccent,
      child:  Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign Up Page",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body:SafeArea(
          child:SingleChildScrollView(
            child:Container(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage("myImg/Uni_logo.png"),
                      width: 250.0,
                      height: 200.0,
                    ),
                    const Text(
                      "Unlock Your Future",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const Text(
                      "Potential,With Us",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Sign Up",
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
                        const Text(
                          "Username",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                                Icons.person
                            ),
                            hintText: 'Enter your username',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                        ),
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
                            border:OutlineInputBorder(
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email cannot be empty';
                            }
                            return null;
                          },
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
                            border:OutlineInputBorder(
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
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password cannot be empty";
                            }else if(value.length <= 5){
                              return "Your password should be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _confirmpasswordController,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                                Icons.lock
                            ),
                            hintText: "Enter your confirm password",
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Confirm password cannot be empty";
                            }else if(value.length <= 5){
                              return "Your confirm password should be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                      ],
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
                                'Sign Up',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15.0,
                              ),
                            ),
                            onPressed: () async {
                              if(_formKey.currentState!.validate()){
                                signUpUserInfo();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignInPage()),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignInPage()),
                                );
                              },
                              child: const Text(
                                "Sign in",
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}