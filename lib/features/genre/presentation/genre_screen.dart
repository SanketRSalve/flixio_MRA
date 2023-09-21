import 'package:flixio_app/components/custom_button.dart';
import 'package:flixio_app/components/custom_text.dart';
import 'package:flixio_app/components/genre_widget.dart';
import 'package:flixio_app/features/movie/presentation/movie_controller.dart';
import 'package:flixio_app/features/movie/presentation/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60.0,
        centerTitle: true,
        title: const CustomText(
          text: "SELECT GENRES",
          size: 20.0,
          fw: FontWeight.w400,
        ),
      ),
      body: SafeArea(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ref.watch(movieControllerProvider).genres.when(
              data: (genres) {
                return Expanded(
                  flex: 4,
                  child: GridView.builder(
                      itemCount: genres.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 2.5),
                      itemBuilder: (context, index) {
                        final genre = genres[index];
                        return GenreTextWidget(
                          genre: genre,
                          onTap: () {
                            ref
                                .read(movieControllerProvider.notifier)
                                .toggleSelected(genre);
                          },
                        );
                      }),
                );
              },
              error: (e, st) => Text(e.toString()),
              loading: () => const CircularProgressIndicator()),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: "Rating",
                        size: 16.0,
                        fw: FontWeight.normal,
                      ),
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            fill: 1.0,
                            size: 14.0,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          CustomText(
                            text: ref
                                .watch(movieControllerProvider)
                                .rating
                                .toString(),
                            size: 16.0,
                            fw: FontWeight.normal,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Slider(
                    value: ref.watch(movieControllerProvider).rating.toDouble(),
                    min: 1,
                    max: 10,
                    divisions: 10,
                    activeColor: Color(0xffd3a121),
                    onChanged: (value) {
                      ref
                          .read(movieControllerProvider.notifier)
                          .updateRating(value.toInt());
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomButton(
            text: 'GET MOVIE',
            onTap: () {
              ref.read(movieControllerProvider.notifier).getRecommendedMovie();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MovieScreen(),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
