import 'package:flutter/material.dart';
import 'package:majlis_library/library_screens/library_book_club/library_book_club.dart';
import 'package:majlis_library/library_screens/library_book_list_view/library_book_list_view.dart';
import 'package:majlis_library/library_screens/library_book_registration/library_book_registration.dart';
import 'package:majlis_library/library_screens/library_book_review/library_book_review.dart';

class LibraryStudentControlPage extends StatelessWidget {
  const LibraryStudentControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Student'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Refresh"),
                onTap: () {},
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("Favourites"),
                onTap: () {},
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              print("Refresh is selected.");
            } else if (value == 1) {
              print("Favourites is selected.");
            } else if (value == 2) {
              print("Logout menu is selected.");
            }
          })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://imgs.search.brave.com/faD9AizMIawWSYaiJ5rM7p49X7QGlyzuBxvQz6KkZ5w/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTA2/MTQxNzIxNC9waG90/by9saWJyYXJ5Lmpw/Zz9zPTYxMng2MTIm/dz0wJms9MjAmYz02/alhSVTREMDRRWGow/QjhMUDZ5ZXZYS29C/SlpNdFJXOG1FWlZX/ZmZEdEl3PQ'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 30),
                  child: Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Color(0xffFFC5C5),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/library_images/BookListView.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 30),
                  child: Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Color(0xffFFEBD8),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/library_images/BookRegistration.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 50),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LibraryBookListView()),
                      );
                    },
                    child: Text(
                      'Catalogue',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(115, 245, 234, 234),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 57),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LibraryBookRegistrationPage()),
                      );
                    },
                    child: Text(
                      'Book Registration',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(115, 245, 234, 234),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 30),
                  child: Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Color(0xffFC7DCA7),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/library_images/BookReview.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 30),
                  child: Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Color(0xff89B9AD),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/library_images/ComingSoon.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 44),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LibraryBookReviewPage()),
                      );
                    },
                    child: Text(
                      'Book Review',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(115, 245, 234, 234),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 59),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LibraryBookClub()),
                      );
                    },
                    child: Text(
                      'Coming Soon',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(115, 245, 234, 234),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
