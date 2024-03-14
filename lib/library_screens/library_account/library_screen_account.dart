import 'package:flutter/material.dart';
import 'package:majlis_library/library_screens/library_Librarian_Control_page/library_Librarian_Control_Page.dart';
import 'package:majlis_library/library_screens/library_Student_Control_Page/library_student_control_page.dart';

class LibraryScreenAcconut extends StatefulWidget {
  const LibraryScreenAcconut({super.key});

  @override
  State<LibraryScreenAcconut> createState() => _LibraryScreenAcconutState();
}

class _LibraryScreenAcconutState extends State<LibraryScreenAcconut> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    if (emailController.text == 'MAJLIS_LIBRARY' &&
        passwordController.text == 'MUSF@123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LibraryLibrarianControlPage()),
      );
      emailController.clear();
      passwordController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          padding: EdgeInsets.all(13),
          height: 75,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 172, 31, 31),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login Failed",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Incorrect email or password.",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
    }
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log In'),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/library_images/lib2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 330,
              height: 200,
              child: Center(
                child: Column(
                  children: [
                    Title(
                      color: Colors.black,
                      child: const Text(
                        'Manage your account',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("USER"),
                      titleAlignment: ListTileTitleAlignment.center,
                      contentPadding: EdgeInsets.only(left: 105, bottom: 10),
                      hoverColor: Colors.black,
                      iconColor: Colors.blue,
                      focusColor: Colors.black,
                      splashColor: Colors.deepOrange,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LibraryStudentControlPage()),
                        );
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.library_add_rounded),
                      title: Text("LIBRARIAN"),
                      titleAlignment: ListTileTitleAlignment.center,
                      contentPadding: EdgeInsets.only(left: 105, top: 10),
                      hoverColor: Colors.black,
                      iconColor: Colors.blue,
                      focusColor: Colors.black,
                      splashColor: Colors.deepOrange,
                      onTap: () {
                        return _showAlertDialog(context);
                      },
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 244, 247, 244),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                      spreadRadius: 0.2,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
