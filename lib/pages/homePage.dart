import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tele_drive_app/tools/commonWidgets/folder_icon.dart';
import 'package:unicons/unicons.dart';

import '../const.dart';
import '../tools/commonWidgets/media_icon.dart';
import '../tools/commonWidgets/rounded_image.dart';
import '../tools/itemTile.dart';
import 'hidden.dart';

// final gridCountProvider = StateProvider<int>((ref) => 0);

// class MyHome extends ConsumerWidget {
//   const MyHome({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var height = MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
//             ? MediaQuery.of(context).size.width
//             : MediaQuery.of(context).size.height;
//
//     var width =
//         MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
//             ? MediaQuery.of(context).size.width
//             : MediaQuery.of(context).size.height;
//     int count = (((MediaQuery.of(context).size.width) / 384.0) * 2).toInt();
//     final items = ref.watch<List<Item>>(itemsProvider);
//
//     final ThemeData theme = Theme.of(context);
//     final Color appBarBackgroundColor = theme.brightness == Brightness.light
//         ? Colors.white // Light theme color
//         : Colors.black;
//     final Color appBackgroundColor = theme.brightness == Brightness.light
//         ? const Color.fromARGB(255, 238, 238, 238) // Light theme color
//         : const Color.fromARGB(255, 24, 24, 24);
//     final Color menuColor = theme.brightness == Brightness.light
//         ? Colors.white // Light theme color
//         : const Color.fromARGB(255, 24, 24, 24);
//     double expandedHeight = 0.0;
//     if ((MediaQuery.of(context).size.height) > (MediaQuery.of(context).size.width)) {
//       expandedHeight = (MediaQuery.of(context).size.height) * 0.6 / 2;
//     } else {
//       expandedHeight = (MediaQuery.of(context).size.height) * 0.50;
//     }
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: appBackgroundColor,
//             pinned: true,
//             bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(0),
//               child: Container(
//                 // width: double.maxFinite,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(25),
//                       topRight: Radius.circular(25)),
//                   color: appBarBackgroundColor,
//                 ),
//                 // padding: EdgeInsets.only(top: 5, bottom: 10),
//               ),
//             ),
//             elevation: 0,
//             expandedHeight: expandedHeight, //(MediaQuery.of(context).size.height) * 0.75 / 2.0,
//             flexibleSpace: LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//               return FlexibleSpaceBar(
//                 background: Padding(
//                     padding: EdgeInsets.only(
//                         left: (width) * 0.020,
//                         right: (width) * 0.020,
//                         bottom: (width) * 0.050),
//                     child: Center(
//                       child: CarouselSlider(
//                           items: [
//                             Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(35),
//                                     color: Colors.white),
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(35),
//                                     child: Image.asset("assets/images/Untitled.jpg", fit: BoxFit.cover,))
//                             ),
//                             const RoundedImage(
//                               imageUrl: 'assets/images/Untitled1.jpg',
//                               fit: BoxFit.cover,
//                             ),
//                             const RoundedImage(
//                               imageUrl: 'assets/images/Untitled2.jpg',
//                               fit: BoxFit.cover,
//                             ),
//                             const RoundedImage(
//                               imageUrl: 'assets/images/Untitled3.jpg',
//                               fit: BoxFit.cover,
//                             ),
//                           ],
//                           options: CarouselOptions(
//                             height: (height) * 0.60 / 2.0,
//                             viewportFraction: 1,
//                             autoPlay: true,
//                             enableInfiniteScroll: true,
//                             autoPlayCurve: Curves.fastOutSlowIn,
//                             autoPlayAnimationDuration: const Duration(milliseconds: 800),)
//                       ),
//                     )),
//                 stretchModes: const [StretchMode.zoomBackground],
//               );
//             }),
//             stretch: true,
//           ),
//           SliverGrid.builder(
//             itemCount: items.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               childAspectRatio: 0.9,
//             ),
//             itemBuilder: (context, index) =>
//                 itemTile(items[index].id, index, items[index].name),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MyHome extends StatelessWidget {
  const MyHome({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color menuColor = theme.brightness == Brightness.light ? Colors.white : const Color.fromARGB(255, 24, 24, 24);
    final Color appBackgroundColor = theme.brightness == Brightness.light ? const Color.fromARGB(255, 238, 238, 238) : const Color.fromARGB(255, 24, 24, 24);
    final Color appBarBackgroundColor = theme.brightness == Brightness.light ? Colors.white : Colors.black;
    BorderRadiusGeometry border = const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: CarouselSlider(
                  items: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.asset("assets/images/Untitled.jpg", fit: BoxFit.cover,))
                    ),
                    const RoundedImage(
                      imageUrl: 'assets/images/Untitled1.jpg',
        
                      fit: BoxFit.cover,
                    ),
                    const RoundedImage(
                      imageUrl: 'assets/images/Untitled2.jpg',
                      fit: BoxFit.cover,
                    ),
                    const RoundedImage(
                      imageUrl: 'assets/images/Untitled3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                  options: CarouselOptions(
                    height: (size.height) * 0.2,
                    viewportFraction: 1,
                    autoPlay: true,
                  )
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 6,
                          blurRadius: 15,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: border,
                      color: appBarBackgroundColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GridView.count(
                          crossAxisCount: 3,
                          children: const [
                          FolderIcon(folderName: "folderName"),
                          FolderIcon(folderName: "folderName"),
                          FolderIcon(folderName: "folderName"),
                          MediaIcon(folderName: "media 1", thumbnailUrl: 'assets/images/Untitled.jpg',),
                          MediaIcon(folderName: "media 1", thumbnailUrl: 'assets/images/Untitled.jpg',),
                          FolderIcon(folderName: "Folder 2"),
                          FolderIcon(folderName: "Folder 3"),
                          FolderIcon(folderName: "folderName"),
                          MediaIcon(folderName: "media 1", thumbnailUrl: 'assets/images/Untitled.jpg',),
                          FolderIcon(folderName: "Folder 3"),
                          FolderIcon(folderName: "Folder 3"),
                          FolderIcon(folderName: "Folder 3"),
                          FolderIcon(folderName: "Folder 3"),
                        ],
                      ),
                    )
                  ),
                  ClipRRect(
                    borderRadius: border,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: border,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {sendFileToTelegram();},
                                icon: const Icon(UniconsLine.plus_circle)),
                            IconButton(
                                onPressed: () {}, icon: const Icon(UniconsLine.search)),
                            PopupMenuButton(
                              color: menuColor,
                              elevation: 4,
                              offset: Offset(0.0, size.height* 0.0070,),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    child: const Text("Hide or un-hide albums"),
                                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const hidden()),);}
                                ),
                              ],
                              onSelected: (value) {},
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
