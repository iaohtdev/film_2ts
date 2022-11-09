import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_info/routers/app_pages.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayTrailerPage extends GetView<PlayTrailerController> {
  PlayTrailerPage({Key? key,required this.id}) : super(key: key);
int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerBuilder(
         
          player: YoutubePlayer(
            controller: controller.youtubePlayerController,
            onEnded: (metaData) {
              controller.youtubePlayerController.seekTo(Duration(seconds: 0));
              controller.youtubePlayerController.pause();
            },
            topActions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.youtubePlayerController.pause();
                      Get.offAllNamed(Routes.detailpage,arguments: id);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.grey.withOpacity(0.4),
                      child: Image.asset(
                        "assets/icons/icon-cancel.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          builder: (context, player) {
            return player;
          }),
    );
  }
}

class PlayTrailerController extends GetxController {
  String key = Get.arguments;
  late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: key,
      flags: YoutubePlayerFlags(autoPlay: true),
    );
    super.onInit();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }
}
