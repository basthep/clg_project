import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LibraryBookReviewPage extends StatefulWidget {
  @override
  _LibraryBookReviewPageState createState() => _LibraryBookReviewPageState();
}

class _LibraryBookReviewPageState extends State<LibraryBookReviewPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _reviewController = TextEditingController();
  TextEditingController _writtenByController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref('/library/bookreview');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Review'),
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
                  TextFormField(
                      controller: _writtenByController,
                      decoration: InputDecoration(labelText: 'Written By'),
                      validator: (value) => value == null || value.isEmpty
                          ? 'field is required'
                          : null),
                  SizedBox(height: 16.0),
                  TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: 'Book Title'),
                      validator: (value) => value == null || value.isEmpty
                          ? 'field is required'
                          : null),
                  SizedBox(height: 16.0),
                  TextFormField(
                      controller: _authorController,
                      decoration: InputDecoration(labelText: 'Author'),
                      validator: (value) => value == null || value.isEmpty
                          ? 'field is required'
                          : null),
                  SizedBox(height: 16.0),
                  TextFormField(
                      controller: _reviewController,
                      maxLines: 5,
                      decoration: InputDecoration(labelText: 'Review'),
                      validator: (value) => value == null || value.isEmpty
                          ? 'field is required'
                          : null),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        databaseRef
                            .child(DateTime.now()
                                .millisecondsSinceEpoch
                                .toString())
                            .set({
                              'Written By':
                                  _writtenByController.text.toString(),
                              'Book Name': _titleController.text.toString(),
                              'Author Name': _authorController.text.toString(),
                              'Review': _reviewController.text.toString(),
                              'id': DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString()
                            })
                            .then((value) {})
                            .onError((error, stackTrace) {});
                        _writtenByController.clear();
                        _titleController.clear();
                        _reviewController.clear();
                        _reviewController.clear();

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

                        // Handle the book review submission logic here
                        String writtenby = _writtenByController.text;
                        String title = _titleController.text;
                        String author = _authorController.text;
                        String review = _reviewController.text;

                        print(
                            'Written By: $writtenby\nTitle: $title\nAuthor: $author\nReview: $review');
                      }
                    },
                    child: Text('Submit Review'),
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
