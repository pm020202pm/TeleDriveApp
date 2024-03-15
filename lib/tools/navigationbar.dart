
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../pages/favourites.dart';
import '../pages/homePage.dart';
import '../pages/recent.dart';
import 'States/nav_notifier.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _bottomBarState();
}

class _bottomBarState extends ConsumerState<MyHomePage> {
  static final List<Widget> screens = <Widget>[
    const MyHome(),
    const recent(),
    const favourites(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = (size.width>size.height) ? size.width : size.height;
    double width = (size.width<size.height) ? size.width : size.height;
    var navIndex = ref.watch(navProvider);
    return Scaffold(
      body: Center(child: screens[navIndex.index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex.index,
        onTap: (value) {
          if (value == 3) {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  // color: Colors.white,
                  width: (width),
                  height: (height) * 0.25,
                  child: Wrap(
                    children: [
                      iconButton(
                          navIndex.isDarkMode ? "Light Mode" : "Dark Mode", () {
                        ref.read(navProvider.notifier).toggleTheme();
                        Navigator.of(context).pop();
                      },
                          Icon(
                            navIndex.isDarkMode
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                          )),
                      iconButton(
                          "profile",
                          () {},
                          Icon(
                            UniconsLine.user,
                          )),
                      iconButton("settings", () {},
                          Icon(
                            UniconsLine.setting,
                          )),
                      iconButton(
                          "Recycle bin",
                          () {},
                          Icon(
                            UniconsLine.trash,
                          )),
                      iconButton(
                          "Shared",
                          () {},
                          Icon(UniconsLine.users_alt,
                              size:
                                  (MediaQuery.of(context).size.height) * 0.03)),
                    ],
                  ),
                );
              },
            );
          } else {
            ref.read(navProvider.notifier).onIndexChanged(value);
          }
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.estate),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.clock_eight),
            label: "Recent",
          ),
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.favorite),
              label: "Favourites"),
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.bars),
              label: "menu"),
        ],
      ),
    );
  }

  Widget iconButton(String name, Function function, Icon icon) {
    var height = MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.032, left: (width) * 0.024),
      child: Container(
        height: (height) * 0.094,
        width: (width) * 0.22,
        child: FloatingActionButton(
            onPressed: () {
              function();
            },
            elevation: 0,
            // backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all((width) * 0.02),
                child: icon,
              ),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ])),
      ),
    );
  }
}
