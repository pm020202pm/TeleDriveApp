import 'package:flutter/material.dart';
import 'package:tele_drive_app/tools/commonWidgets/folder_icon.dart';
class FolderPage extends StatelessWidget {
  const FolderPage({super.key, required this.folderName});
  final String folderName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_new_rounded)
        ),
        title: Text(folderName),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          FolderIcon(folderName: "Folder 1"),
          FolderIcon(folderName: "Folder 2"),
          FolderIcon(folderName: "Folder 3"),
          FolderIcon(folderName: "Folder 4"),
          FolderIcon(folderName: "Folder 5"),
        ],
      ),
    );
  }
}
