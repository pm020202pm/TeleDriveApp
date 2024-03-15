import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:unicons/unicons.dart';

class MediaIcon extends StatelessWidget {
  const MediaIcon({super.key, required this.folderName, required this.thumbnailUrl});
  final String folderName;
  final String thumbnailUrl;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color appBackgroundColor = theme.brightness == Brightness.light
        ? Colors.white // Light theme color
        : Colors.black;
    final Color menuColor = theme.brightness == Brightness.light
        ? Colors.white // Light theme color
        : const Color.fromARGB(255, 24, 24, 24);

    return Material(
      color: Colors.transparent,
        child: FocusedMenuHolder(
      menuWidth: 200,
      openWithTap: false,
      onPressed: () {},
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
            backgroundColor: menuColor,
            title: const Text("Favourites"),
            trailingIcon: const Icon(Icons.favorite_border),
            onPressed: () {}),
        FocusedMenuItem(
            backgroundColor: menuColor,
            title: const Text("Share"),
            trailingIcon: const Icon(UniconsLine.share_alt),
            onPressed: () {}),
        FocusedMenuItem(
            backgroundColor: menuColor,
            title: const Text("Delete"),
            trailingIcon: const Icon(UniconsLine.trash_alt),
            onPressed: () {}),
        FocusedMenuItem(
            backgroundColor: menuColor,
            title: const Text("Rename"),
            trailingIcon: const Icon(UniconsLine.pen),
            onPressed: () {}),
        FocusedMenuItem(
            backgroundColor: menuColor,
            title: const Text("Hide"),
            trailingIcon: const Icon(UniconsLine.eye_slash),
            onPressed: () {}),
        FocusedMenuItem(
            backgroundColor: menuColor,
            title: const Text("Change cover image"),
            trailingIcon: const Icon(UniconsLine.image_edit),
            onPressed: () {}),
      ],
      child: InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>FolderPage(folderName: folderName,)));
        },
        splashColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
        radius: 70,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 21),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                      child: Image.asset(thumbnailUrl, height: 65, width: 70, fit: BoxFit.fill,))
                ),
                Text(folderName,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey.shade700))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
