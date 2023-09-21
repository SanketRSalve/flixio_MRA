import 'package:flixio_app/components/custom_button.dart';
import 'package:flixio_app/components/custom_text.dart';
import 'package:flixio_app/features/genre/presentation/genre_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          //Background Image
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken),
              child: Image.asset(
                'images/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // App Name
          const Center(
            child: CustomText(
              text: 'FLIXIO',
              size: 50,
              fw: FontWeight.bold,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                const CustomText(
                    text: "Ready to find your perfect movie match? ",
                    size: 20.0,
                    fw: FontWeight.normal),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const CustomText(
                    text:
                        "Simply tell us your preferred genre and desired rating, and let Flixio work its magic! ",
                    size: 15.0,
                    fw: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                  text: 'GET STARTED',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GenreScreen(),
                      ),
                    );
                  }
                  // child: Container(
                  //   width: MediaQuery.of(context).size.width * 0.5,
                  //   padding: const EdgeInsets.all(10.0),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.white),
                  //       borderRadius: BorderRadius.circular(15.0)),
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CustomText(
                  //         text: "GET STARTED",
                  //         size: 15.0,
                  //         fw: FontWeight.normal,
                  //       ),

                  //       // SizedBox(
                  //       //     height: 20.0,
                  //       //     child: Image.asset('images/gsign.png',
                  //       //         fit: BoxFit.fitHeight))
                  //     ],
                  //   ),
                  // ),

                  ),
            ),
          ),
        ],
      ),
    );
  }
}
