import 'package:flutter/material.dart';
import 'package:majlis_library/library_screens/library_home/library_screen_home_sample.dart';

class LibraryManagerBottomNavigation extends StatelessWidget {
  const LibraryManagerBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      builder: (BuildContext ctx, int UpdatedIndex, Widget? _) {
        return BottomNavigationBar(
            currentIndex: UpdatedIndex,
            onTap: (newIndex) {
              ScreenHome.selectedIndexNotifier.value = newIndex;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account'),
            ]);
      },
    );
  }
}
