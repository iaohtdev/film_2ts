import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/cast_crew.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/models/trailler.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_share/flutter_share.dart';
class DetailMovieController extends GetxController {
  Rx<MovieModel> movieModel = MovieModel().obs;
  Rx<Trailer> trailerModel = Trailer().obs;
  RxList<Cast> lstCast = <Cast>[].obs;
  RxList<MovieModel> lstRcm = <MovieModel>[].obs;
  RxList<CastAndCrew> lstCrew = <CastAndCrew>[].obs;
  PaletteGenerator? paletteGenerator;
  int idMovie = Get.arguments;
  late YoutubePlayerController youtubePlayerController;
  RxList<MovieModel> lstFavorite = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void dispose() {
    youtubePlayerController.dispose();

    super.dispose();
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

  Future addFavorite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
        FirebaseFirestore.instance.collection("favorite");
    return _collectionReference
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "id": movieModel.value.id,
      "image": movieModel.value.backdropPath,
      "name": movieModel.value.title
    }).then((value) {
      print("add to favorite");
    });
  }

  Future removeFavorite(DocumentReference<Object?> documentReference) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.delete(documentReference);
    }).then((value) {

        print("remove favorite");
    });
  }
    Future<void> share() async {
    await FlutterShare.share(
      title: 'Example share',
      text: 'Example share text',
      linkUrl: 'https://flutter.dev/',
      chooserTitle: 'Example Chooser Title'
    );
  }
}
