import 'package:flixio_app/features/genre/domain/genre.dart';
import 'package:flutter/material.dart';

class GenreTextWidget extends StatelessWidget {
  const GenreTextWidget({
    super.key,
    required this.genre,
    required this.onTap,
  });
  final Genre genre;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: genre.isSelected == false
                ? const Color(0xFF004866)
                : const Color(0xFF138BDD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(
                color: Color(0xff023e7d),
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            genre.name,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}
