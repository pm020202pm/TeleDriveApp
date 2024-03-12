import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:unicons/unicons.dart';

class Item {
  final int id;
  final String name;
  final bool isVisible; // Add a name field
  Item(this.id, this.name, this.isVisible);
}

final itemsProvider =
    StateNotifierProvider<ItemsNotifier, List<Item>>((ref) => ItemsNotifier());

class ItemsNotifier extends StateNotifier<List<Item>> {
  ItemsNotifier() : super([]);

  void addItem() {
    state = [
      ...state,
      Item(state.length + 1, 'Album ${state.length + 1}', true)
    ];
  }

  void deleteItem(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
    }
  }

  void renameItem(int index, String newName, bool isVisible) {
    if (index >= 0 && index < state.length) {
      state[index] = Item(state[index].id, newName, isVisible);
      state = List.from(state); // Notify listeners
    }
  }

  void changeVisibility(int index, String name, bool isVisible) {
    state[index] = Item(state[index].id, name, !isVisible);
    state = List.from(state);
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
        final bool isVisible =
            ref.watch<List<Item>>(itemsProvider)[index].isVisible;
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Visibility(
            visible: isVisible,
            child: FocusedMenuHolder(
              blurBackgroundColor: appBackgroundColor,
              menuWidth: width * 0.5,
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
                    title: const Text("Favourites"),
                    trailingIcon: Icon(Icons.favorite_border),
                    onPressed: () {}),
                FocusedMenuItem(
                    backgroundColor: menuColor,
                    title: const Text("Share"),
                    trailingIcon: Icon(UniconsLine.share_alt),
                    onPressed: () {}),
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
                      ref
                          .read(itemsProvider.notifier)
                          .changeVisibility(index, albumName, isVisible);
                    }),
                FocusedMenuItem(
                    backgroundColor: menuColor,
                    title: const Text("Change cover image"),
                    trailingIcon: Icon(UniconsLine.image_edit),
                    onPressed: () {}
                    // ref
                    //     .read(itemsProvider.notifier)
                    //     .changeVisibility(index, albumName, isVisible);

                    ),
              ],
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: appBackgroundColor),
                child: GridTile(
                  child: Stack(children: [
                    Column(
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
                  ]),
                ),
              ),
            ),
          ),
        );
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
                  .renameItem(index, controller.text, true);
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
