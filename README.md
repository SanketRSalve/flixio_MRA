# FLIXIO - A Movie Suggestion App

![Banner Image](images/FlixioApp.png)

Flixio is a Flutter-based mobile application that suggests movies based on selected genres and ratings.

[![Flutter Version](https://img.shields.io/badge/Flutter-latest-blue.svg)](https://flutter.dev/docs/get-started/install)
[![Dart Version](https://img.shields.io/badge/Dart-latest-blue.svg)](https://dart.dev/get-dart)


## Features

- User can select genres and rating preferences.
- The app suggests movies based on the chosen criteria.
- Utilizes TMDB API to fetch movie data.

## Dependencies

Make sure you have the following dependencies installed:
- [dio](https://pub.dev/packages/dio)
- [Riverpod](https://pub.dev/packages/flutter_riverpod)
- [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)
- [google_fonts](https://pub.dev/packages/google_fonts)

To install these dependencies, add the following to your `pubspec.yaml` file and run `flutter pub get`:
```yaml
dependencies:
  dio: ^latest_version
  riverpod: ^latest_version
  font_awesome_flutter: ^latest_version
  google_fonts: ^latest_version
```

## Installation
1. Clone the repository:
```https://github.com/SanketRSalve/flixio_MRA.git
cd flixio_MRA/
```
2. Install dependencies:
```
flutter pub get
```
4. Run the app:
```
flutter run
```
For more details on Flutter installation and setup, refer to the [Flutter Documentation](https://docs.flutter.dev/get-started/install).

## Usage
- Open the app and select your preferred movie genres.
- Set your desired movie rating.
- The app will suggest movies based on your selections.

## Acknowledgments
- [TMDB](https://www.themoviedb.org) for providing movie data.
