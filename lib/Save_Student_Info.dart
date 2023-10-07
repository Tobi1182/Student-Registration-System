import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_record_keeping_system/Home_Page.dart';
import 'package:student_record_keeping_system/Landing_Page.dart';
import 'package:student_record_keeping_system/View_Student_Info.dart';

class  SavePage extends StatefulWidget {
  const  SavePage({super.key});
  @override
  _SaveStudentInfoPageState createState() =>  _SaveStudentInfoPageState();
}

class  _SaveStudentInfoPageState extends State<SavePage> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final userName = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _studentnameController = TextEditingController();
  final TextEditingController _studentidController = TextEditingController();
  final TextEditingController _studentphoneController = TextEditingController();
  final TextEditingController _studentaddressController = TextEditingController();
  final TextEditingController _studentemailController = TextEditingController();
  final TextEditingController _studentdateofbirthController = TextEditingController();
  final TextEditingController _programofstudyController = TextEditingController();
  final TextEditingController _yearofenrollController = TextEditingController();

  Future addStudentInfo(String studentName,String studentID,
      String studentPhoneNumber,String studentAddress,String studentEmail,
      String studentDateOfBirth,String programOfStudy,
      String yearOfEnrolment) async{
    await FirebaseFirestore.instance.collection(
        "Users"
    ).add({
      "Student Name": studentName,
      "Student ID": studentID,
      "Student Phone Number": studentPhoneNumber,
      "Student Address": studentAddress,
      "Student Email": studentEmail,
      "Student Date Of Birth": studentDateOfBirth,
      "Program Of Study": programOfStudy,
      "Year Of Enrolment": yearOfEnrolment,
    });
  }

  saveStudentInfo(){
    addStudentInfo(
      _studentnameController.text.trim(),
      _studentidController.text.trim(),
      _studentphoneController.text.trim(),
      _studentaddressController.text.trim(),
      _studentemailController.text.trim(),
      _studentdateofbirthController.text.trim(),
      _programofstudyController.text.trim(),
      _yearofenrollController.text.trim(),
    );
  }

  @override
  void dispose() {
    _studentnameController.dispose();
    _studentidController.dispose();
    _studentphoneController.dispose();
    _studentaddressController.dispose();
    _studentemailController.dispose();
    _studentdateofbirthController.dispose();
    _programofstudyController.dispose();
    _yearofenrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Save Student Info Page",
      color: Colors.deepPurpleAccent,
      child:  Scaffold(
        appBar: AppBar(
          title: const Text(
            "Save Student Info Page",
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
                      "Empowering Education",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const Text(
                      "With Secure Student Record",
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
                      "Save student record",
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
                          "Student Name",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _studentnameController,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                                Icons.person
                            ),
                            hintText: 'Enter student name',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Student name cannot be empty";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Student ID",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _studentidController,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                                Icons.badge,
                            ),
                            hintText: 'Enter student ID',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Student ID cannot be empty";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Student Phone Number",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _studentphoneController,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                                Icons.phone
                            ),
                            hintText: 'Enter student phone number',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Student phone number cannot be empty";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Student Address",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _studentaddressController,
                          keyboardType: TextInputType.multiline,
                            maxLines: 3,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Enter student address',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                              // height: 5.0,
                            ),
                            prefixIcon: Container(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: const Icon(
                                  Icons.contact_mail
                              ),
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Student address cannot be empty";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Student Email",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _studentemailController,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                                Icons.mail
                            ),
                            hintText: 'Enter student email',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Student email cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Student Date Of Birth",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _studentdateofbirthController,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                                Icons.cake,
                            ),
                            hintText: 'Enter student date of birth',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Student date of birth cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Program Of Study",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _programofstudyController,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                              Icons.school,
                            ),
                            hintText: 'Choose program of study',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Student program of study cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height:10.0),
                        const Text(
                          "Year Of Enrolment",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _yearofenrollController,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: const Icon(
                              Icons.calendar_month_outlined,
                            ),
                            hintText: 'Enter student year of enrolment',
                            hintStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Student year of enrolment cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: SizedBox
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
                            'Save',
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize:15.0,
                            ),
                          ),
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){
                              saveStudentInfo();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    const ViewStudentInfoPage()),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin:const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15.0,
                              fontFamily: "Montserrat",
                            ),
                          )
                      ),
                    )
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

