import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LibraryBookRegistrationPage extends StatefulWidget {
  @override
  _LibraryBookRegistrationPageState createState() =>
      _LibraryBookRegistrationPageState();
}

class _LibraryBookRegistrationPageState
    extends State<LibraryBookRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _personNameController = TextEditingController();
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _authorNameController = TextEditingController();
  final TextEditingController _bookNumberController = TextEditingController();

  final databaseRef =
      FirebaseDatabase.instance.ref('/library/bookregistration');
  final ref = FirebaseDatabase.instance.ref('/library/fullList');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Registration Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Book Registration',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _personNameController,
                    decoration: InputDecoration(
                      labelText: 'Name of Person',
                      icon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                      controller: _bookNameController,
                      decoration: InputDecoration(
                        labelText: 'Name of Book',
                        icon: Icon(Icons.book),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'field is required'
                          : null),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _authorNameController,
                    decoration: InputDecoration(
                      labelText: 'Name of Author',
                      icon: Icon(Icons.person_outline),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _bookNumberController,
                    decoration: InputDecoration(
                      labelText: 'Book Number',
                      icon: Icon(Icons.confirmation_number),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        databaseRef
                            .child(DateTime.now()
                                .millisecondsSinceEpoch
                                .toString())
                            .set({
                              'Person Name':
                                  _personNameController.text.toString(),
                              'Book Name': _bookNameController.text.toString(),
                              'Author Name':
                                  _authorNameController.text.toString(),
                              'Book Number':
                                  _bookNumberController.text.toString(),
                              'id': DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                              'Date': DateTime.now().toString(),
                            })
                            .then((value) {})
                            .onError((error, stackTrace) {});
                        ref
                            .child(DateTime.now()
                                .millisecondsSinceEpoch
                                .toString())
                            .set({
                              'Person Name':
                                  _personNameController.text.toString(),
                              'Book Name': _bookNameController.text.toString(),
                              'Author Name':
                                  _authorNameController.text.toString(),
                              'Book Number':
                                  _bookNumberController.text.toString(),
                              'id': DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                              'Date': DateTime.now().toString(),
                            })
                            .then((value) {})
                            .onError((error, stackTrace) {});
                        _personNameController.clear();
                        _bookNameController.clear();
                        _authorNameController.clear();
                        _bookNumberController.clear();

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Container(
                            padding: EdgeInsets.all(16),
                            height: 90,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 34, 128, 47),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 48,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Well Done",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "Record Submitted!",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
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
                        // Handle book registration logic here
                        String personName = _personNameController.text;
                        String bookName = _bookNameController.text;
                        String authorName = _authorNameController.text;
                        String bookNumber = _bookNumberController.text;

                        print(
                            'Person Name: $personName\nBook Name: $bookName\nAuthor Name: $authorName\nBook Number: $bookNumber');
                      }
                    },
                    child: Text(
                      'Register Book',
                      style: TextStyle(fontSize: 18.0),
                    ),
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
