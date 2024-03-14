import 'package:flutter/material.dart';

import '../library_common/library_color_extenstion.dart';

class LibraryRoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const LibraryRoundButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: LibraryTColor.primary,
      height: 50,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class RoundLineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundLineButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: getColor(Colors.white, LibraryTColor.primary),
        foregroundColor: getColor(LibraryTColor.primary, Colors.white),
        shadowColor: MaterialStateProperty.resolveWith(
            (states) => LibraryTColor.primary),
        minimumSize: MaterialStateProperty.resolveWith(
            (states) => const Size(double.maxFinite, 50)),
        elevation: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.pressed) ? 1 : 0),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
                width: 1,
                color: states.contains(MaterialState.pressed)
                    ? Colors.transparent
                    : LibraryTColor.primary),
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.pressed) ? colorPressed : color);
  }
}

class MiniLibraryRoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const MiniLibraryRoundButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
            (states) => LibraryTColor.primary),
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
        shadowColor: MaterialStateProperty.resolveWith(
            (states) => LibraryTColor.primary),
        minimumSize:
            MaterialStateProperty.resolveWith((states) => const Size(150, 35)),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.pressed) ? colorPressed : color);
  }
}
