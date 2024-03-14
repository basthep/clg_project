import 'package:majlis_library/library_screens/library_common/library_color_extenstion.dart';
import 'package:majlis_library/library_screens/library_book_reading/library_book_reading_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:majlis_library/library_screens/library_common_widget/library_best_seller_cell.dart';
import 'package:majlis_library/library_screens/library_common_widget/library_recently_cell.dart';
import 'package:majlis_library/library_screens/library_common_widget/library_round_button.dart';
import 'package:majlis_library/library_screens/library_common_widget/library_round_textfield.dart';
import 'package:majlis_library/library_screens/library_common_widget/library_top_picks_cell.dart';

class LibraryScreenSubHome extends StatefulWidget {
  const LibraryScreenSubHome({super.key});

  @override
  State<LibraryScreenSubHome> createState() => _LibraryScreenSubHomeState();
}

class _LibraryScreenSubHomeState extends State<LibraryScreenSubHome> {
  final databaseRef = FirebaseDatabase.instance.ref('/library/updateinfo');
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  List topPicksArr = [
    {
      "name": "The Dissapearance of Emila Zola",
      "author": "Michael Rosen",
      "img": "assets/library_images/1.jpg"
    },
    {
      "name": "Fatherhood",
      "author": "Marcus Berkmann",
      "img": "assets/library_images/2.jpg"
    },
    {
      "name": "The Time Travellers Handbook",
      "author": "Larry Downs",
      "img": "assets/library_images/3.jpg"
    },
    {
      "name": "Big Bang Disruption",
      "author": "Stride Lottie",
      "img": "assets/library_images/13.jpg"
    },
    {
      "name": "The Heart Of Hell",
      "author": "Mitch Weiss",
      "img": "assets/library_images/14.jpg"
    },
    {
      "name": "Zoo",
      "author": "James Patterson",
      "img": "assets/library_images/15.jpg",
    }
  ];

  List bestArr = [
    {
      "name": "In A Land Of Paper Gods",
      "author": "by Rebecca Mackenzie",
      "about author":
          "Rebecca Mackenzie spent her childhood in Thailand, Malaysia and India. She lives in London. Her first novel, IN A LAND OF PAPER GODS, was published by Tinder Press in January 2016 and was shortlisted for the 2017 RSL Ondaatje Prize for a distinguished work of fiction, non-fiction or poetry, evoking the spirit of a place.",
      "about book":
          "A story of a child far from home and caught between two cultures, In A Land of Paper Gods marries exuberant imagination with sharp pathos, and introduces Rebecca Mackenzie as a striking and original new voice.",
      "img": "assets/library_images/4.jpg",
      "rating": 5.0
    },
    {
      "name": "Tattle tale",
      "author": "by Sarah J. Noughton",
      "about author":
          "Sarah j nauton was born in 1975 and grew up in dorsetShe studied English Literature at UCL and has been in London ever since, spending ten years as a copywriter in an advertising agency before giving it up to have children. ",
      "about book":
          "The perfect brother. The perfect fiancee. The perfect revenge.A thriller you won’t be able to predict.One day changes Jody’s life forever.She has shut herself down, haunted by her memories and unable to trust anyone. But then she meets Abe, the perfect stranger next door and suddenly life seems full of possibility and hope.One day changes Mags’s life forever.After years of estrangement from her family, Mags receives a shocking phone call. Her brother Abe is in hospital and no-one knows what happened to him. She meets his fiancé Jody, and gradually pieces together the ruins of the life she left behind. But the pieces don’t quite seem to fit…",
      "img": "assets/library_images/5.jpg",
      "rating": 4.0
    },
    {
      "name": "Zoo",
      "author": "Josh Bazville",
      "about author":
          "James Patterson (born March 22, 1947, Newburgh, New York, U.S.) American author, principally known for his thriller and suspense novels, whose prolific output and business savvy made him a ubiquitous presence on best-seller lists in the late 20th and early 21st centuries.",
      "about book":
          "The story is interesting but so beyond reason I never really felt the suspense. While this story contains no aliens or supernatural events, it’s sci-fi in the vein of Jurassic Park: animals have become a threat to human existence, because of how humans have manipulated the natural world, and it’s up to one guy to convince the rest that humanity will go extinct unless they do something drastic. I’ve never read Pet Cemetary or Cujo or any of those classic animal-attack books, but I have read Congo and The Lost World, and I’ve gotta say that this is absolutely not my genre. I don’t know how I managed to finish them all in the first place, and I don’t really see myself every going back to this type of story.",
      "img": "assets/library_images/6.jpg",
      "rating": 3.0
    }
  ];

  List recentArr = [
    {
      "name": "The Fatal Tree",
      "author": "by Jake Arnott",
      "img": "assets/library_images/10.jpg"
    },
    {
      "name": "Day Four",
      "author": "by LOTZ, SARAH",
      "img": "assets/library_images/11.jpg"
    },
    {
      "name": "Door to Door",
      "author": "by Edward Humes",
      "img": "assets/library_images/12.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                          color: LibraryTColor.primary,
                          borderRadius:
                              BorderRadius.circular(media.width * 0.5)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Row(children: const [
                        Text(
                          "Our Top Picks",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPicksArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var iObj = topPicksArr[itemIndex] as Map? ?? {};
                          return LibraryTopPicksCell(
                            iObj: iObj,
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Most Popular",
                          style: TextStyle(
                              color: LibraryTColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.9,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: bestArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = bestArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LibraryBookReadingView(
                                              bObj: bObj,
                                            )));
                              },
                              child: LibraryBestSellerCell(
                                bObj: bObj,
                              ),
                            );
                          })),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "New Comings",
                          style: TextStyle(
                              color: LibraryTColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.7,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: recentArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = recentArr[index] as Map? ?? {};

                            return LibraryRecentlyCell(
                              iObj: bObj,
                            );
                          })),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Update Info",
                          style: TextStyle(
                              color: LibraryTColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          color: LibraryTColor.textbox.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion.",
                              style: TextStyle(
                                color: LibraryTColor.subTitle,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            LibraryRoundTextField(
                              controller: txtName,
                              hintText: "Name",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            LibraryRoundTextField(
                              controller: txtEmail,
                              hintText: "Email Address",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MiniLibraryRoundButton(
                                  title: "Register",
                                  onPressed: () {
                                    String id = DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString();
                                    databaseRef.child(id).set({
                                      'Name': txtName.text.toString(),
                                      'Email': txtEmail.text.toString(),
                                      'id': id
                                    }).then((value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Welcome! We\'ll inform you of the latest updates through your email.',
                                          ),
                                        ),
                                      );
                                    }).onError((error, stackTrace) {});
                                    txtName.clear();
                                    txtEmail.clear();
                                  },
                                )
                              ],
                            )
                          ]),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
