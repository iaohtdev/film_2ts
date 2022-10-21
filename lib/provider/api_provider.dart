import 'package:movie_info/provider/tmdb_service.dart';

const BASE_URL = "https://image.tmdb.org/t/p/w500";
const API_KEY = "7d9e3be468d2633d523c6e3e72fcab4a";
const ACCESS_TOKEN =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDllM2JlNDY4ZDI2MzNkNTIzYzZlM2U3MmZjYWI0YSIsInN1YiI6IjYzNDNiMzVhMDdlMjgxMDA3YTA0ODBmZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZB7HFjvdOwk85foZUiC3W2yacu_Oxaz9612AKY0821Y";

class ApiProvider {
  Future getPopularMovie() async {
    Map popularMovie =
        await TmdbService().tmdbWithCustomLog.v3.movies.getPopular();
    return popularMovie;
  }

  Future getTopRate() async {
    Map topRate = await TmdbService().tmdbWithCustomLog.v3.movies.getTopRated();
    return topRate;
  }

  Future getNowPlaying() async {
    Map nowPlaying =
        await TmdbService().tmdbWithCustomLog.v3.movies.getNowPlaying();
    return nowPlaying;
  }

  Future getUpComing() async {
    Map upComing =
        await TmdbService().tmdbWithCustomLog.v3.movies.getUpcoming();
    return upComing;
  }

  Future getTvOnTheAir() async {
    Map upComing = await TmdbService().tmdbWithCustomLog.v3.tv.getOnTheAir();
    return upComing;
  }

  Future getTvPopular() async {
    Map tvPopular = await TmdbService().tmdbWithCustomLog.v3.tv.getPopular();
    return tvPopular;
  }

  Future getTvTopRate() async {
    Map tvTopRate = await TmdbService().tmdbWithCustomLog.v3.tv.getTopRated();
    return tvTopRate;
  }

  Future getDetailMovie(int idMovie) async {
    Map detailMovie = await TmdbService()
        .tmdbWithCustomLog
        .v3
        .movies
        .getDetails(idMovie, language: "vi");
    return detailMovie;
  }

  Future getCastAndCrew(int idMovie) async {
    Map cast = await TmdbService().tmdbWithCustomLog.v3.movies.getCredits(
          idMovie,
        );
    return cast;
  }

  Future getLstRcm(int idMovie) async {
    Map lstRcm = await TmdbService().tmdbWithCustomLog.v3.movies.getRecommended(
          idMovie,
        );
    return lstRcm;
  }

  Future getTrailler(int idMovie) async {
    Map trailler = await TmdbService().tmdbWithCustomLog.v3.movies.getVideos(
          idMovie,
        );
    return trailler;
  }
}
