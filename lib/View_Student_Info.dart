import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_record_keeping_system/Home_Page.dart';
import 'package:student_record_keeping_system/Landing_Page.dart';
import 'package:student_record_keeping_system/Save_Student_Info.dart';
import 'package:student_record_keeping_system/Update_Student_Info.dart';

class ViewStudentInfoPage extends StatefulWidget {
  const ViewStudentInfoPage({super.key});
  @override
  _ViewStudentInfoPageState createState() => _ViewStudentInfoPageState();
}

class _ViewStudentInfoPageState extends State<ViewStudentInfoPage> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final userName = FirebaseAuth.instance.currentUser!;

  final StudentInfoCollection =
      FirebaseFirestore.instance.collection("Users").snapshots();

  void DeleteStudentInfo(String id) async {
    await FirebaseFirestore.instance.collection("Users").doc(id).delete();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Student information has been deleted")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "View Student Info Page",
      color: Colors.deepPurpleAccent,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "View Student Info Page",
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
                        fit: BoxFit.cover),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        child: Image.asset("myImg/Uni_logo.png"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Gusto",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                fontSize: 23.0),
                          ),
                          Text(
                            "University",
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: 23.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70, right: 30),
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
                child: Column(
                  children: [
                    ListTile(
                        leading: const Icon(
                          Icons.dashboard,
                          size: 30,
                        ),
                        title: const Text(
                          "Dashboard",
                          style: TextStyle(
                              fontFamily: "Montserrat", fontSize: 18.0),
                        ),
                        selected: _selectedIndex == 0,
                        selectedColor: Colors
                            .deepPurpleAccent, // Set the selected tile color
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                          return _onItemTapped(0);
                        }),
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
                        selectedColor: Colors
                            .deepPurpleAccent, // Set the selected tile color
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SavePage()));
                          return _onItemTapped(1);
                        }),
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
                      selectedColor: Colors
                          .deepPurpleAccent, // Set the selected tile color
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewStudentInfoPage()));
                        return _onItemTapped(2);
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
                      fixedSize: const Size(150, 50),
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
                              builder: (context) => const LandingScreen()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage("myImg/Uni_logo.png"),
                      width: 250.0,
                      height: 200.0,
                    ),
                    const Text(
                      "The Power of",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const Text(
                      "Information,View Students Record Now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "View student record",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    StreamBuilder(
                      stream: StudentInfoCollection,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List<QueryDocumentSnapshot> studentdocuments =
                              snapshot.data!.docs;
                          if (studentdocuments.isEmpty) {
                            return Center(
                              child: Text(
                                "No student information yet",
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            );
                          }
                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount: studentdocuments.length,
                              itemBuilder: (context, index) {
                                final studentsInfo = studentdocuments[index]
                                    .data() as Map<String, dynamic>;
                                final studentsInfoId =
                                    studentdocuments[index].id;
                                final String studentName =
                                    studentsInfo["Student Name"];
                                final String studentID =
                                    studentsInfo["Student ID"];
                                final String studentPhoneNumber =
                                    studentsInfo["Student Phone Number"];
                                final String studentAddress =
                                    studentsInfo["Student Address"];
                                final String studentEmail =
                                    studentsInfo["Student Email"];
                                final String studentDateOfBirth =
                                    studentsInfo["Student Date Of Birth"];
                                final String programOfStudy =
                                    studentsInfo["Program Of Study"];
                                final String yearOfEnrolment =
                                    studentsInfo["Year Of Enrolment"];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 15.0),
                                  child: Card(
                                    elevation: 4,
                                    color: Colors.grey[100],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            "Student Name: $studentName \n\n"
                                            "ID: $studentID\n\n"
                                            "Phone Number: $studentPhoneNumber\n\n"
                                            "Address: $studentAddress\n\n"
                                            "Email: $studentEmail\n\n"
                                            "Date Of Birth: $studentDateOfBirth\n\n"
                                            "Program Of Study: $programOfStudy\n\n"
                                            "Year Of Enrolment: $yearOfEnrolment",
                                            style:const TextStyle(
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                           UpdatePage
                                                            (
                                                             studentname:studentName,
                                                             studentid:studentID,
                                                             studentphonenumber:studentPhoneNumber,
                                                             studentaddress:studentAddress,
                                                             studentemail:studentEmail,
                                                             studentdateofbirth:studentDateOfBirth,
                                                             programofstudy:programOfStudy,
                                                             yearofenrolment:yearOfEnrolment,
                                                             id: studentsInfoId,
                                                          ),
                                                  ),
                                                );
                                              },
                                              icon:const Icon(Icons.edit),
                                              splashRadius: 25,
                                              color: Colors.grey[600],
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                DeleteStudentInfo(
                                                    studentsInfoId);
                                              },
                                              icon: const Icon(Icons.delete),
                                              splashRadius: 25,
                                              color: Colors.grey[600],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text("There was an error"),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SavePage()),
            );
          },
          backgroundColor: Colors.deepPurpleAccent,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
