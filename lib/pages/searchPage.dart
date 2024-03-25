import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tele_drive_app/tools/commonWidgets/rounded_image.dart';
import 'package:tele_drive_app/tools/itemTile.dart';
import 'package:unicons/unicons.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _recentState();
}

class _recentState extends State<searchPage> {
  //only a sample to search from
  static final List<itemTile> items = [
    itemTile(1, 0, "album1"),
    itemTile(2, 1, "album2"),
    itemTile(3, 2, "album3"),
    itemTile(4, 3, "album4"),
    itemTile(5, 4, "album5"),
    itemTile(6, 5, "album6"),
    itemTile(7, 6, "album7"),
    itemTile(8, 7, "album8"),
    itemTile(9, 8, "album9"),
  ];
  // a list that will be visible after searching
  List<itemTile> displayList = List.from(items);

  void updateList(String value) {
    setState(() {
      displayList = items
          .where((element) =>
              element.albumName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: CarouselSlider(
                items: const [
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
                  height: (size.height) * 0.2,
                  viewportFraction: 1,
                  autoPlay: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  labelText: 'Search',
                  hintText: 'eg: chem notes',
                  prefixIcon: Icon(UniconsLine.search),
                  prefixIconColor: Color.fromARGB(242, 124, 124, 124),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: displayList.isEmpty
                    ? Center(
                        child: Text("No result found"),
                      )
                    : ListView.builder(
                        itemCount: displayList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: ClipRect(
                              child: Image.asset(
                                "lib/assets/images/grids/${displayList[index].gridNum}.jpg",
                              ),
                            ),
                            title: Text(displayList[index].albumName!),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
