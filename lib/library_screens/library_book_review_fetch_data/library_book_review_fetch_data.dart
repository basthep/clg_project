import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class LibraryBookReviewFetchData extends StatefulWidget {
  const LibraryBookReviewFetchData({Key? key}) : super(key: key);

  @override
  State<LibraryBookReviewFetchData> createState() =>
      _LibraryBookReviewFetchDataState();
}

class _LibraryBookReviewFetchDataState
    extends State<LibraryBookReviewFetchData> {
  Query dbRef = FirebaseDatabase.instance.ref().child('/library/bookreview');
  final searchFilter = TextEditingController();

  Widget listItem({required Map bookdetail}) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(128, 128, 128, 128),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookdetail['Book Name'],
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            bookdetail['Author Name'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            bookdetail['Review'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '                                             Written By ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
              ),
              Text(
                bookdetail['Written By'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Reviews'),
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
          Expanded(
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                final BookName = snapshot.child('Book Name').value.toString();
                Map bookdetail = snapshot.value as Map;
                bookdetail['key'] = snapshot.key;

                if (searchFilter.text.isEmpty) {
                  return listItem(bookdetail: bookdetail);
                } else if (BookName.toLowerCase()
                    .contains(searchFilter.text.toLowerCase().toString())) {
                  return listItem(bookdetail: bookdetail);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
