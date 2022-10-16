import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/page/favorite/favorite_page.dart';
import 'package:movie_info/page/home/home_page.dart';
import 'package:movie_info/page/navigation_bar/navigation_controller.dart';
import 'package:movie_info/page/profile/profile_page.dart';

class NavigationBarWidget extends GetView<NavigationBarController> {
  const NavigationBarWidget({Key? key}) : super(key: key);

  static const List<Widget> _lstPage = <Widget>[
    HomePage(),
    // CategoryPage(),
    FavoritePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: _body(),
      bottomNavigationBar: _bottomNavibar(),
    );
  }

  Widget _body() {
    return Obx(() => _lstPage.elementAt(controller.selectedIndex.value));
  }

  Widget _bottomNavibar() {
    return Stack(
      children: [
        Container(
          height: 75,
          color: kBlack,
        ),
        Container(
            height: 75,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kLightGreen.withOpacity(0.3), kBlack.withOpacity(0.1)],
              ),
            ),
            child: Obx(
              () => BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.ontapNavi,
                backgroundColor: Colors.transparent,
//                  showSelectedLabels: false,
//  showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 0
                        ? SvgPicture.asset(
                            "assets/icons/icon-home.svg",
                            height: 25,
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            "assets/icons/icon-home-outline.svg",
                            height: 35,
                            color: Colors.white,
                          ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 1
                        ? SvgPicture.asset(
                            "assets/icons/icon-favorite.svg",
                            height: 40,
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            "assets/icons/icon-favorite_outline.svg",
                            height: 40,
                            color: Colors.white,
                          ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 2
                        ? SvgPicture.asset(
                            "assets/icons/icon-profile.svg",
                            height: 25,
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            "assets/icons/icon-profile_outline.svg",
                            height: 25,
                            color: Colors.white,
                          ),
                    label: '',
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 100;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.blueGrey,
                pinned: true,
                expandedHeight: 100,
                collapsedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: _isShrink
                      ? const Text(
                          "2T NGUYEN",
                        )
                      : null,
                  background: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Xin chào, ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '2T Nguyễn',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Get.to(() => Test());
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/poster_2.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                actions: _isShrink
                    ? [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/poster_2.jpg"),
                                  fit: BoxFit.cover)),
                        )
                      ]
                    : null,
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("Item: $index")),
                    );
                  },
                  childCount: 50,
                ),
              ),
            ],
          ),
        ),
      
      ),
    );
  }
}
