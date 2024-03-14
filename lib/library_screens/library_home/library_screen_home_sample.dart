import 'package:flutter/material.dart';
import 'package:majlis_library/library_screens/library_account/library_screen_account.dart';
import 'package:majlis_library/library_screens/library_home/library_widgets/library_bottom_navigation.dart';
import 'package:majlis_library/library_screens/library_sub_home/library_screen_subhome.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    LibraryScreenSubHome(),
    LibraryScreenAcconut(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAJLIS LIBRARY'),
        backgroundColor: Colors.blue[300],
        centerTitle: true,
      ),
      bottomNavigationBar: const LibraryManagerBottomNavigation(),
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: selectedIndexNotifier,
              builder: (BuildContext ctx, int UpdatedIndex, Widget? _) {
                return _pages[UpdatedIndex];
              })),
    );
  }
}
