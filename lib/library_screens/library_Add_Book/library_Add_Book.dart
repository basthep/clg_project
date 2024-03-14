import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LibraryAddBook extends StatefulWidget {
  const LibraryAddBook({super.key});

  @override
  State<LibraryAddBook> createState() => _LibraryAddBookState();
}

class _LibraryAddBookState extends State<LibraryAddBook> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final BookNameController = TextEditingController();
  final AuthorNameController = TextEditingController();
  final CategoryController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref('/library/addbook');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 131, 191, 240),
        title: Text('Add Book'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Refresh"),
                onTap: () {},
                height: BorderSide.strokeAlignCenter,
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              print("Refresh is selected.");
            } else if (value == 1) {
              print("Settings menu is selected.");
            } else if (value == 2) {
              print("Logout menu is selected.");
            }
          }),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://imgs.search.brave.com/faD9AizMIawWSYaiJ5rM7p49X7QGlyzuBxvQz6KkZ5w/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTA2/MTQxNzIxNC9waG90/by9saWJyYXJ5Lmpw/Zz9zPTYxMng2MTIm/dz0wJms9MjAmYz02/alhSVTREMDRRWGow/QjhMUDZ5ZXZYS29C/SlpNdFJXOG1FWlZX/ZmZEdEl3PQ'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(40.0),
              height: 450.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffDDDDDD),
                    blurRadius: 1.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.0, 0.0),
                  )
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Title(
                          color: Colors.blue,
                          child: Text(
                            'ADD BOOK',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 25, right: 10, left: 10, bottom: 10),
                      child: TextFormField(
                          textAlign: TextAlign.start,
                          controller: BookNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: ("Book Name"),
                              hintStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              hintMaxLines: 2,
                              hintTextDirection: TextDirection.ltr),
                          validator: (value) => value == null || value.isEmpty
                              ? 'field is required'
                              : null),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          textAlign: TextAlign.start,
                          controller: AuthorNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: ("Author Name"),
                              hintStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              hintMaxLines: 2,
                              hintTextDirection: TextDirection.ltr),
                          validator: (value) => value == null || value.isEmpty
                              ? 'field is required'
                              : null),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          textAlign: TextAlign.start,
                          controller: CategoryController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: ("Category"),
                              hintStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              hintMaxLines: 2,
                              hintTextDirection: TextDirection.ltr),
                          validator: (value) => value == null || value.isEmpty
                              ? 'field is required'
                              : null),
                    ),
                    SizedBox(
                      height: 60,
                      width: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String id = DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString();
                              databaseRef
                                  .child(id)
                                  .set({
                                    'Book Name':
                                        BookNameController.text.toString(),
                                    'Author Name':
                                        AuthorNameController.text.toString(),
                                    'Category':
                                        CategoryController.text.toString(),
                                    'id': id
                                  })
                                  .then((value) {})
                                  .onError((error, stackTrace) {});
                              BookNameController.clear();
                              AuthorNameController.clear();
                              CategoryController.clear();

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Container(
                                  padding: EdgeInsets.all(16),
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 34, 128, 47),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
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
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "Record Submitted!",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
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
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
