import 'package:flixio_app/components/custom_button.dart';
import 'package:flixio_app/components/custom_text.dart';
import 'package:flixio_app/features/movie/presentation/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: ref.watch(movieControllerProvider).movie.when(
            data: (movie) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff0f0f0f), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          stops: [0.0, 0.5]),
                    ),
                    child: Image.network(
                      movie.backdropPath.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                movie.title,
                                style: const TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Color(0xffFFC107),
                                  borderRadius: BorderRadius.circular(16.0)),
                              child: Center(
                                  child: Text(
                                "Rating ${movie.voteAverage}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )),
                            )
                          ],
                        ),
                        Text(
                          movie.releaseDate,
                          style: const TextStyle(color: Color(0xff9C9C9C)),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        const CustomText(
                            text: 'Description',
                            size: 18.0,
                            fw: FontWeight.normal),
                        Text(
                          movie.overview,
                          style: const TextStyle(color: Color(0xff9C9C9C)),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: CustomButton(
                      text: 'GO AGAIN',
                      onTap: () {
                        ref
                            .read(movieControllerProvider.notifier)
                            .getRecommendedMovie();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MovieScreen()));
                      },
                    ),
                  ),
                ],
              );
            },
            error: (e, st) => const Text('Something went wrong'),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
