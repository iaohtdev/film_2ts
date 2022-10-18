import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/provider/api_provider.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailMovieController extends GetxController {
  Rx<MovieModel> movieModel = MovieModel().obs;
  PaletteGenerator? paletteGenerator;
int idMovie = Get.arguments;

  @override
  void onInit() {
    super.onInit();
     
  }
 Future<String>  getDetailMovie() async {
    await ApiProvider().getDetailMovie(idMovie).then((respone) async {
      movieModel.value = await MovieModel.fromJson(respone);





  


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
