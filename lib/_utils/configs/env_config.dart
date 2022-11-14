import '../constants/enums.dart';

class EnvConfig {
  final String appTitle;
  final Flavor flavor;
  final String apiBaseUrl;
  final String imageBaseUrl;
  final String apiKey;
  final String language;

  EnvConfig({
    required this.appTitle,
    required this.flavor,
    required this.apiBaseUrl,
    required this.imageBaseUrl,
    required this.apiKey,
    required this.language,
  });
}

final development = EnvConfig(
  appTitle: "PrepOwl Dev",
  flavor: Flavor.dev,
  apiBaseUrl: "https://api.themoviedb.org/3",
  imageBaseUrl: "https://image.tmdb.org/t/p/w500",
  apiKey: "65ee47d743f17bdb30c86cef505966b7",
  language: "en-US",
);

final staging = EnvConfig(
  appTitle: "PrepOwl Staging",
  flavor: Flavor.staging,
  apiBaseUrl: "https://api.themoviedb.org/3",
  imageBaseUrl: "https://image.tmdb.org/t/p/w500",
  apiKey: "65ee47d743f17bdb30c86cef505966b7",
  language: "en-US",
);
final uat = EnvConfig(
  appTitle: "PrepOwl UAT",
  flavor: Flavor.uat,
  apiBaseUrl: "https://api.themoviedb.org/3",
  imageBaseUrl: "https://image.tmdb.org/t/p/w500",
  apiKey: "65ee47d743f17bdb30c86cef505966b7",
  language: "en-US",
);

final production = EnvConfig(
  appTitle: "PrepOwl",
  flavor: Flavor.prod,
  apiBaseUrl: "https://api.themoviedb.org/3",
  imageBaseUrl: "https://image.tmdb.org/t/p/w500",
  apiKey: "65ee47d743f17bdb30c86cef505966b7",
  language: "en-US",
);
