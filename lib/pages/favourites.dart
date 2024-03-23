import 'package:carousel_slider/carousel_slider.dart';
//import 'package:disease_detect/tools/commonWidgets/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tele_drive_app/tools/commonWidgets/rounded_image.dart';
import 'package:unicons/unicons.dart';

class FavoriteItem {
  final int id;
  final String name;

  FavoriteItem(this.id, this.name);
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<FavoriteItem>>(
  (ref) => FavoritesNotifier(),
);

class FavoritesNotifier extends StateNotifier<List<FavoriteItem>> {
  FavoritesNotifier() : super([]);

  void addItem(FavoriteItem item) {
    state = [...state, item];
  }

  void removeItem(int id) {
    state = state.where((item) => item.id != id).toList();
  }
}

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    // int count = (((MediaQuery.of(context).size.width) / 384.0) * 2).toInt();
    var height =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;

    var width =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
    // int count = (((MediaQuery.of(context).size.width) / 384.0) * 2).toInt();
    // var navIndex = ref.watch(navProvider);
    // final items = ref.watch<List<Item>>(itemsProvider);

    final ThemeData theme = Theme.of(context);
    final Color appBarBackgroundColor = theme.brightness == Brightness.light
        ? Colors.white // Light theme color
        : Colors.black;
    final Color appBackgroundColor = theme.brightness == Brightness.light
        ? const Color.fromARGB(255, 238, 238, 238) // Light theme color
        : const Color.fromARGB(255, 24, 24, 24);
    //  final Color menuColor = theme.brightness == Brightness.light
    //       ? Colors.white // Light theme color
    //       : Color.fromARGB(255, 24, 24, 24);
    double expandedHeight = 0.0;
    if ((MediaQuery.of(context).size.height) >
        (MediaQuery.of(context).size.width)) {
      expandedHeight = (MediaQuery.of(context).size.height) * 0.80 / 2;
    } else
      expandedHeight = (MediaQuery.of(context).size.height) * 0.50;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBackgroundColor,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: appBarBackgroundColor,
                ),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(UniconsLine.search)),
                    )),
                width: double.maxFinite,

                // padding: EdgeInsets.only(top: 5, bottom: 10),
              ),
            ),
            // backgroundColor: const Color.fromARGB(255, 245, 245, 245),
            elevation: 0,
            expandedHeight:
                expandedHeight, //(MediaQuery.of(context).size.height) * 0.75 / 2.0,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return FlexibleSpaceBar(
                background: Padding(
                    padding: EdgeInsets.only(
                        left: (width) * 0.020,
                        right: (width) * 0.020,
                        bottom: (width) * 0.050),
                    child: Center(
                      child: CarouselSlider(
                          items: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.white),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(35),
                                    child: Image.asset(
                                      "assets/images/Untitled.jpg",
                                      fit: BoxFit.cover,
                                    ))),
                            RoundedImage(
                              imageUrl: 'assets/images/Untitled1.jpg',
                              fit: BoxFit.cover,
                            ),
                            RoundedImage(
                              imageUrl: 'assets/images/Untitled2.jpg',
                              fit: BoxFit.cover,
                            ),
                            RoundedImage(
                              imageUrl: 'assets/images/Untitled3.jpg',
                              fit: BoxFit.cover,
                            ),
                          ],
                          options: CarouselOptions(
                            height: (height) * 0.60 / 2.0,
                            viewportFraction: 1,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                          )),
                    )),
                stretchModes: [StretchMode.zoomBackground],
              );
            }),
            stretch: true,
          ),
          SliverList.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final item = favorites[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(100, 179, 189, 201)),
                      borderRadius: BorderRadius.circular(35),
                      color: appBackgroundColor),
                  child: Container(
                    child: Stack(children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8),
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(28),
                                    topRight: Radius.circular(28),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                child: Image.asset(
                                  width: double.maxFinite,
                                  height: height * 0.2,
                                  "assets/images/grids/${item.id}.jpg",
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 4, bottom: 4),
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: (height) * 0.021),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(
                                  // Check if the item is in favorites

                                  Icons.delete,

                                  // Change the color of the icon if it's in favorites
                                ),
                                onPressed: () {
                                  // Toggle the item in favorites

                                  ref
                                      .read(favoritesProvider.notifier)
                                      .removeItem(item.id);
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),

                  //  ListTile(

                  //   title: Text(item.name),
                  //   leading: Image.asset("assets/images/grids/${item.id}.jpg"),
                  //   trailing: IconButton(
                  //     icon: Icon(
                  //       // Check if the item is in favorites

                  //       Icons.delete,

                  //       // Change the color of the icon if it's in favorites
                  //     ),
                  //     onPressed: () {
                  //       // Toggle the item in favorites

                  //       ref.read(favoritesProvider.notifier).removeItem(item.id);
                  //     },
                  //   ),
                  //   // You can add more UI customization here
                  // ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
