import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_record_keeping_system/Landing_Page.dart';
import 'package:student_record_keeping_system/Save_Student_Info.dart';
import 'package:student_record_keeping_system/View_Student_Info.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState  extends State<HomePage>{
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final userName = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Home Page",
      color: Colors.deepPurpleAccent,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home Page",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("myImg/greyBackground.jpg"),
                        fit: BoxFit.cover
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        child:Image.asset("myImg/Uni_logo.png"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const [
                          Text(
                            "Gusto",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                fontSize: 23.0
                            ),
                          ),
                          Text(
                            "University",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 23.0
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70,right: 30),
                child: Column(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 70.0,
                    ),
                    Text(
                      userName.email!,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25.0),
                child:Column(
                  children: [
                    ListTile(
                        leading: const Icon(
                          Icons.dashboard,
                          size: 30,
                        ),
                        title: const Text(
                          "Dashboard",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 18.0
                          ),
                        ),
                        selected: _selectedIndex == 0,
                        selectedColor: Colors.deepPurpleAccent,// Set the selected tile color
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage())
                          );
                          return _onItemTapped(0);
                        }
                    ),
                    ListTile(
                        leading: const Icon(
                          Icons.save,
                          size: 30.0,
                        ),
                        title: const Text(
                          "Save",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18.0,
                          ),
                        ),
                        selected: _selectedIndex == 1,
                        selectedColor: Colors.deepPurpleAccent,// Set the selected tile color
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SavePage())
                          );
                          return _onItemTapped(1);
                        }
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.visibility,
                        size: 30.0,
                      ),
                      title: const Text(
                        "View",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18.0,
                        ),
                      ),
                      selected: _selectedIndex == 2,
                      selectedColor: Colors.deepPurpleAccent, // Set the selected tile color
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewStudentInfoPage())
                        );
                        return _onItemTapped(3);
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150,50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text("Logout"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LandingScreen())
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body:SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage("myImg/Uni_logo.png"),
                      width: 250.0,
                      height: 250.0,
                    ),
                      const Text(
                        "Welcome to our student registration system",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 22.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25.0),
                      child: const Text(
                        "Things you can do",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                    const Text(
                      "With just a few clicks,you can save"
                      " and organize student records efficiently."
                      ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox
                      (
                      width: 150,
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
                          'Save',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SavePage()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    const Text(
                      textAlign: TextAlign.center,
                      "Discover the ease of navigating"
                      " through detailed student information"
                      " on their card."
                      ,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SizedBox
                        (
                        width: 150,
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
                            'View',
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15.0,
                            ),
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ViewStudentInfoPage()),
                            );
                          },
                        ),
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
