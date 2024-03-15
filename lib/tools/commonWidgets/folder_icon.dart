import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:tele_drive_app/pages/folderPage.dart';
import 'package:unicons/unicons.dart';
class FolderIcon extends StatelessWidget {
  const FolderIcon({super.key,required this.folderName});
  // final Function() onTap;
  final String folderName;
  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);

    final Color menuColor = theme.brightness == Brightness.light
        ? Colors.white // Light theme color
        : const Color.fromARGB(255, 24, 24, 24);
    return Material(
      color: Colors.transparent,
      child: FocusedMenuHolder(
        menuWidth: 200,
        openWithTap: false,
        onPressed: (){},
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
              onPressed: () {}
          ),
        ],
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FolderPage(folderName: folderName,)));
          },
          splashColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
          radius: 70,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              padding:EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.folder_rounded, color: Colors.grey.shade500, size: 100,),
                  ),
                  Text(folderName,
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey.shade700)
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
