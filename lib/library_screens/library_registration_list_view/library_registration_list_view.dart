import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class LibraryRegistrationListView extends StatefulWidget {
  const LibraryRegistrationListView({super.key});

  @override
  State<LibraryRegistrationListView> createState() =>
      _LibraryRegistrationListViewState();
}

class _LibraryRegistrationListViewState
    extends State<LibraryRegistrationListView> {
  final ref =
      FirebaseDatabase.instance.ref('library').child('bookregistration');
  final searchFilter = TextEditingController();

  void _showAlertDialog(BuildContext context, snapshot) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Return Book'),
          content:
              const Text('Are you sure the book is returned to the library?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                _deleteBook(snapshot!);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Registration List'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              decoration: InputDecoration(
                  hintText: 'Search', border: OutlineInputBorder()),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: Center(
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.grey,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    CircularProgressIndicator()
                  ]),
                ),
                itemBuilder: (context, snapshot, animation, index) {
                  final PersonName =
                      snapshot.child('Person Name').value.toString();
                  if (searchFilter.text.isEmpty) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                            snapshot.child('Person Name').value.toString()),
                        subtitle:
                            Text(snapshot.child('Book Name').value.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(snapshot.child('Date').value.toString()),
                            IconButton(
                              icon: Icon(Icons.task_alt),
                              onPressed: () {
                                _showAlertDialog(context, snapshot.key);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (PersonName.toLowerCase()
                      .contains(searchFilter.text.toLowerCase().toString())) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            snapshot.child('Person Name').value.toString()),
                        subtitle:
                            Text(snapshot.child('Book Name').value.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(DateTime.now().toString()),
                            IconButton(
                              icon: Icon(Icons.task_alt),
                              onPressed: () {
                                _showAlertDialog(context, snapshot.key);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
    );
  }

  void _deleteBook(String bookId) {
    ref.child(bookId).remove();
    print('Deleting book with ID: $bookId');
  }

  void _navigateToReviewPage(Map<String, dynamic> bookData) {
    print('Navigating to review page for book: ${bookData['Book Name']}');
  }
}
