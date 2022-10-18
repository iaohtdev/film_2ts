import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/cast_crew.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/models/trailler.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailMovieController extends GetxController {
  Rx<MovieModel> movieModel = MovieModel().obs;
  Rx<Trailer> trailerModel = Trailer().obs;
  RxList<Cast> lstCast = <Cast>[].obs;
  RxList<MovieModel> lstRcm = <MovieModel>[].obs;
  RxList<CastAndCrew> lstCrew = <CastAndCrew>[].obs;
  PaletteGenerator? paletteGenerator;
  int idMovie = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  Future<String> getDataMovie() async {
    await ApiProvider().getDetailMovie(idMovie).then((respone) async {
      movieModel.value = await MovieModel.fromJson(respone);
    });

    await ApiProvider().getCastAndCrew(idMovie).then((respone) async {
      for (var item in respone["cast"]) {
        lstCast.add(Cast.fromJson(item));
      }
    });
    await ApiProvider().getLstRcm(idMovie).then((respone) {
      for (var item in respone["results"]) {
        lstRcm.add(MovieModel.fromJson(item));
      }
    });
    await ApiProvider().getTrailler(idMovie).then((respone) async {
      trailerModel.value = await Trailer.fromJson(respone["results"][0]);

      print("thoai" + trailerModel.value.key!);
    });
    return Future.value("Data download successfully");
  }

  Future<PaletteGenerator> getColorFromPicture(String imageUrl) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(imageUrl).image,
    );
    return paletteGenerator!;
  }
}
