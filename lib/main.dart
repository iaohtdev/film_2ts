import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_info/firebase_options.dart';
import 'package:movie_info/routers/app_pages.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
     user.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme  :ThemeData(fontFamily: "Varela"),
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // supportedLocales: const <Locale>[
      //   Locale('en', ''),
      //   Locale('sg', ''),3
      // ],
    );
  }
}

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:palette_generator/palette_generator.dart';

// void main() => runApp(MyApp());

// /// The main Application class.
// class MyApp extends StatelessWidget {
//   /// Creates the main Application class.
//   MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Image Colors',
//         theme: ThemeData(
//           primarySwatch: Colors.green,
//         ),
//         home: Scaffold(
//           body: Container(
//             height: Get.height,
//             width: Get.width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 30,
//                 ),
//                 FutureBuilder<PaletteGenerator>(
//                     future: _updatePaletteGenerator("https://picsum.photos/200/300"), // async work
//                     builder: (BuildContext context,
//                         AsyncSnapshot<PaletteGenerator> snapshot) {
//                       switch (snapshot.connectionState) {
//                         case ConnectionState.waiting:
//                           return Center(child: CircularProgressIndicator());
//                         default:
//                           if (snapshot.hasError)
//                             return new Text('Error: ${snapshot.error}');
//                           else {
//                             Color face = snapshot.data!.dominantColor!.color;
//                             return Container(
//                               child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(
//                                     20,
//                                   ),
//                                   child: Image.network(
//                                     "https://picsum.photos/200/300",
//                                     height: 200,
//                                     width: 150,
//                                   )),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: face,
//                                         spreadRadius: 1,
//                                         blurRadius: 8)
//                                   ]),
//                             );
//                           }
//                       }
//                     })
//               ],
//             ),
//           ),
//         ));
//   }

//   PaletteGenerator? paletteGenerator;
//   Future<PaletteGenerator> _updatePaletteGenerator(String imageUrl) async {
//     paletteGenerator = await PaletteGenerator.fromImageProvider(
//       Image.network(imageUrl).image,
//     );
//     return paletteGenerator!;
//   }
// }
