import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movie_info/page/detail/detail_controller.dart';
import 'package:movie_info/page/detail/detail_movie.dart';
import 'package:movie_info/page/home/home_page.dart';
import 'package:movie_info/page/home/home_page_controller.dart';
import 'package:movie_info/page/landing/landing_controller.dart';
import 'package:movie_info/page/landing/landing_page.dart';
import 'package:movie_info/page/login/login_controller.dart';
import 'package:movie_info/page/login/login_page.dart';
import 'package:movie_info/page/navigation_bar/navigation_bar.dart';
import 'package:movie_info/page/navigation_bar/navigation_controller.dart';
part 'app_routes.dart';

class AppPages {
  // ignore: non_constant_identifier_names
  static String INITIAL = FirebaseAuth.instance.currentUser == null
      ? Routes.welcome
      : Routes.navigationbar;

  static navigateDefaultPage() async {
    return AppPages.INITIAL;
  }

  //
  static final routes = [
    /* Example
    GetPage(
      name: ExamplePage.routeName,
      page: () => ExamplePage(),
      binding: GetBinding(ExamplePage.routeName),
    ),
    */
    GetPage(
      name: Routes.welcome,
      page: () => const LandingPage(),
      binding: GetBinding(Routes.welcome),
    ),
    GetPage(
      name: Routes.navigationbar,
      page: () => const NavigationBarWidget(),
      binding: GetBinding(
        Routes.navigationbar,
      ),
    ),
    GetPage(
      name: Routes.homepage,
      page: () => const HomePage(),
      binding: GetBinding(Routes.homepage),
    ),
    GetPage(
        name: Routes.detailpage,
        page: () => const DetailMoviePage(),
        binding: GetBinding(
          Routes.detailpage,
        )),
    GetPage(
      name: Routes.loginpage,
      page: () => LoginPage(),
      binding: GetBinding(
        Routes.loginpage,
      ),
    )
  ];
}

class GetBinding extends Bindings {
  final String routerName;

  GetBinding(this.routerName);

  @override
  void dependencies() {
    switch (routerName) {
      case Routes.welcome:
        Get.lazyPut(() => LandingController());
        break;
      case Routes.navigationbar:
        Get.lazyPut(() => NavigationBarController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => HomeController());

        break;
      case Routes.homepage:
        Get.lazyPut(() => NavigationBarController());
        break;
      case Routes.detailpage:
        Get.lazyPut(() => DetailMovieController());
        break;
      case Routes.loginpage:
        Get.lazyPut(() => LoginController());
        break;
      /* Example
      case ExamplePage.routeName:
        Get.lazyPut(() => ExamplePageController());
        break;
      */
      default:
    }
  }
}
