import 'package:flixio_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomButton extends ConsumerWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25.0),
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffa4161a),
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomText(text: text, size: 15.0, fw: FontWeight.normal),
        ),
      ),
    );
  }
}
