import 'dart:io';

//import 'package:disease_detect/pages/favourites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:tele_drive_app/pages/favourites.dart';
import 'package:unicons/unicons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
//import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Item {
  final int id;
  final String name;
  bool isVisible;
  // Add a name field
  Item(this.id, this.name, {this.isVisible = true});
}

final itemsProvider =
    StateNotifierProvider<ItemsNotifier, List<Item>>((ref) => ItemsNotifier());

class ItemsNotifier extends StateNotifier<List<Item>> {
  ItemsNotifier() : super([]);

  //final List<Item> hiddenItems = [];
  final List<bool> isVisibleList = [];

  void addItem() {
    final newItem = Item(state.length + 1, 'Album ${state.length + 1}');
    state = [...state, newItem];
    while (isVisibleList.length < state.length) {
      isVisibleList.add(true);
    }
  }

  void deleteItem(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
    }
  }

  void renameItem(
    int index,
    String newName,
  ) {
    if (index >= 0 && index < state.length) {
      state[index] =
          Item(state[index].id, newName, isVisible: state[index].isVisible);
      state = List.from(state); // Notify listeners
    }
  }

  // void _initializeVisibility() {
  //   state.forEach((_) {
  //     isVisibleList.add(true); // Initialize visibility to true for all items
  //   });
  // }
  void toggleVisibility(int index) {
    if (index >= 0 && index < state.length) {
      state[index] = Item(
        state[index].id,
        state[index].name,
        isVisible: !state[index].isVisible, // Toggle visibility
      );
      state = List.from(state); // Notify listeners
    }
  }
}

class itemTile extends StatelessWidget {
  final int gridNum;
  final int index;
  final String albumName;
  itemTile(this.gridNum, this.index, this.albumName);

  @override
  Widget build(context) {
    //bool isVisible = true;
    var height =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;

    var width =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
    final ThemeData theme = Theme.of(context);
    final Color appBackgroundColor = theme.brightness == Brightness.light
        ? Colors.white // Light theme color
        : Colors.black;
    final Color menuColor = theme.brightness == Brightness.light
        ? Colors.white // Light theme color
        : const Color.fromARGB(255, 24, 24, 24);

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final FavoritesNotifier favoritesNotifier =
            ref.read(favoritesProvider.notifier);
        final List<FavoriteItem> favorites = ref.watch(favoritesProvider);
        final ItemsNotifier itemsNotifier = ref.read(itemsProvider.notifier);
        final List<Item> items = ref.watch(itemsProvider);

        final Item currentItem = items[index];
        final bool isVisible = currentItem.isVisible;

        return Visibility(
          visible: isVisible,
          maintainState: false,
          maintainSize: false,
          maintainInteractivity: false,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: FocusedMenuHolder(
              blurBackgroundColor: appBackgroundColor,
              menuWidth: width * 0.59,
              openWithTap: false,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const albumDetails()),
                //);
                print("nextPAge");
              },
              menuItems: <FocusedMenuItem>[
                FocusedMenuItem(
                  backgroundColor: menuColor,
                  title: Text(
                    favorites.any((element) => element.id == gridNum)
                        ? "Remove from Favorites"
                        : "Add to Favorites",
                  ),
                  trailingIcon: Icon(
                    // Change the icon based on whether the item is in favorites or not
                    favorites.any((element) => element.id == gridNum)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    // Change the color of the icon if it's in favorites
                    color: favorites.any((element) => element.id == gridNum)
                        ? Colors.red
                        : null,
                  ),
                  onPressed: () {
                    // Toggle the item in favorites
                    if (favorites.any((element) => element.id == gridNum)) {
                      favoritesNotifier.removeItem((gridNum));
                    } else {
                      favoritesNotifier
                          .addItem(FavoriteItem(gridNum, albumName));
                    }
                  },
                ),
                FocusedMenuItem(
                    backgroundColor: menuColor,
                    title: const Text("Share"),
                    trailingIcon: Icon(UniconsLine.share_alt),
                    onPressed: () async {
                      final urlImage = 'assets/images/grids/$gridNum.jpg';
                      final ByteData data = await rootBundle.load(urlImage);
                      final List<int> bytes = data.buffer.asUint8List();

                      //final url = Uri.parse(urlImage);
                      // final response = await http.get(urlImage);
                      // final bytes = response.bodyBytes;

                      final temp = await getTemporaryDirectory();
                      final path = '${temp.path}/image.jpg';
                      File(path).writeAsBytesSync(bytes);

                      await Share.shareFiles([path]);
                    }),
                FocusedMenuItem(
                    backgroundColor: menuColor,
                    title: const Text("Delete"),
                    trailingIcon: Icon(UniconsLine.trash_alt),
                    onPressed: () {
                      ref.read(itemsProvider.notifier).deleteItem(index);
                    }),
                FocusedMenuItem(
                    backgroundColor: menuColor,
                    title: const Text("Rename"),
                    trailingIcon: Icon(UniconsLine.pen),
                    onPressed: () {
                      _showRenameDialog(context, ref, index);
                    }),
                FocusedMenuItem(
                    backgroundColor: menuColor,
                    title: const Text("Hide"),
                    trailingIcon: Icon(UniconsLine.eye_slash),
                    onPressed: () {
                      itemsNotifier.toggleVisibility(index);
                      // ref.read(itemsProvider.notifier).toggleVisibility(index);
                    }),
                FocusedMenuItem(
                    backgroundColor: menuColor,
                    title: const Text("Change cover image"),
                    trailingIcon: Icon(UniconsLine.image_edit),
                    onPressed: () {}
                    //     ref
                    //     .read(itemsProvider.notifier)
                    //     .changeVisibility(index, albumName, isVisible);

                    ),
              ],
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: appBackgroundColor),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset(
                            "assets/images/grids/$gridNum.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 4, bottom: 4),
                        child: Text(
                          albumName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: (height) * 0.021),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
        // } else {
        //   return SizedBox.shrink();
        // }
      },
    );
  }
}

void _showRenameDialog(BuildContext context, WidgetRef ref, int index) {
  TextEditingController controller = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Rename Album"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Enter new name"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(itemsProvider.notifier)
                  .renameItem(index, controller.text);
              Navigator.pop(context);
            },
            child: Text(
              "Rename",
            ),
          ),
        ],
      );
    },
  );
}