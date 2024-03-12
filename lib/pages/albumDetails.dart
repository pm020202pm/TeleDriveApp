// import 'dart:ui';

// import 'package:carousel_slider/carousel_slider.dart';

// import 'package:disease_detect/tools/commonWidgets/rounded_image.dart';
// import 'package:disease_detect/tools/itemTile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:unicons/unicons.dart';

// //final gridCountProvider = StateProvider<int>((ref) => 0);

// class albumDetails extends ConsumerWidget {
//   const albumDetails({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // var navIndex = ref.watch(navProvider);
//     final items = ref.watch<List<Item>>(itemsProvider);

//     final ThemeData theme = Theme.of(context);
//     final Color appBarBackgroundColor = theme.brightness == Brightness.light
//         ? Colors.white // Light theme color
//         : Colors.black;
//     final Color appBackgroundColor = theme.brightness == Brightness.light
//         ? const Color.fromARGB(255, 238, 238, 238) // Light theme color
//         : Color.fromARGB(255, 24, 24, 24);
//     // final Color menuColor = theme.brightness == Brightness.light
//     //     ? Colors.white // Light theme color
//     //     : Color.fromARGB(255, 24, 24, 24);
//     double ExpandedHeight = 0.0;
//     if ((MediaQuery.of(context).size.height) >
//         (MediaQuery.of(context).size.width)) {
//       ExpandedHeight = (MediaQuery.of(context).size.height) * 0.80 / 2;
//     } else
//       ExpandedHeight = (MediaQuery.of(context).size.height) * 0.50;
//     return Scaffold(
//       //backgroundColor: const Color.fromARGB(255, 245, 245, 245),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: appBackgroundColor,
//             pinned: true,
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(0),
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           ref.read(itemsProvider.notifier).addItem();
//                         },
//                         icon: Icon(UniconsLine.plus_circle)),
//                     IconButton(
//                         onPressed: () {}, icon: Icon(UniconsLine.search)),
//                     // PopupMenuButton(
//                     //   color: menuColor,
//                     //   elevation: 4,
//                     //   offset: Offset(
//                     //     0.0,
//                     //     (MediaQuery.of(context).size.height) * 0.0070,
//                     //   ),
//                     //   shape: RoundedRectangleBorder(
//                     //       borderRadius: BorderRadius.circular(20)),
//                     //   itemBuilder: (context) => [
//                     //     PopupMenuItem(
//                     //       child: Padding(
//                     //         padding:
//                     //             const EdgeInsets.only(left: 8.0, right: 8.0),
//                     //         child: Text("Edit"),
//                     //       ),
//                     //     ),
//                     //     PopupMenuItem(
//                     //         child: Padding(
//                     //       padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                     //       child: Text("Select all"),
//                     //     ))
//                     //   ],
//                     //   onSelected: (value) {},
//                     // )
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(25),
//                       topRight: Radius.circular(25)),
//                   color: appBarBackgroundColor,
//                 ),
//                 width: double.maxFinite,
//                 // padding: EdgeInsets.only(top: 5, bottom: 10),
//               ),
//             ),
//             // backgroundColor: const Color.fromARGB(255, 245, 245, 245),
//             elevation: 0,
//             expandedHeight:
//                 ExpandedHeight, //(MediaQuery.of(context).size.height) * 0.75 / 2.0,
//             flexibleSpace: LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//               return FlexibleSpaceBar(
//                 background: Padding(
//                     padding: EdgeInsets.only(
//                         left: (MediaQuery.of(context).size.width) * 0.020,
//                         right: (MediaQuery.of(context).size.width) * 0.020,
//                         bottom: (MediaQuery.of(context).size.width) * 0.050),
//                     child: Center(
//                       child: CarouselSlider(
//                           items: [
//                             Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(35),
//                                     color: Colors.white),
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(35),
//                                     child: Image.asset(
//                                       "assets/images/Untitled.jpg",
//                                       fit: BoxFit.cover,
//                                     ))),
//                             RoundedImage(
//                               imageUrl: 'assets/images/Untitled1.jpg',
//                               fit: BoxFit.cover,
//                             ),
//                             RoundedImage(
//                               imageUrl: 'assets/images/Untitled2.jpg',
//                               fit: BoxFit.cover,
//                             ),
//                             RoundedImage(
//                               imageUrl: 'assets/images/Untitled3.jpg',
//                               fit: BoxFit.cover,
//                             ),
//                           ],
//                           options: CarouselOptions(
//                             height: (MediaQuery.of(context).size.height) *
//                                 0.60 /
//                                 2.0,
//                             viewportFraction: 1,
//                             autoPlay: true,
//                             enableInfiniteScroll: true,
//                             autoPlayCurve: Curves.fastOutSlowIn,
//                             autoPlayAnimationDuration:
//                                 Duration(milliseconds: 800),
//                           )),
//                     )),
//                 stretchModes: [StretchMode.zoomBackground],
//               );
//             }),
//             stretch: true,
//           ),
//           SliverGrid.builder(
//             itemCount: items.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.85,
//             ),
//             itemBuilder: (context, index) =>
//                 itemTile(items[index].id, index, "Album ${items[index].id}"),
//           ),
//         ],
//       ),
//     );
//   }
// }
