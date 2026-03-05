import 'dart:io';

void main() async {
  // Ask user to enter directory path
  stdout.write("Enter directory path: ");
  String? dirPath = stdin.readLineSync();

  if (dirPath == null || dirPath.isEmpty) {
    print("Invalid directory path.");
    return;
  }

  Directory directory = Directory(dirPath);

  if (!directory.existsSync()) {
    print("Directory does not exist.");
    return;
  }

  int count = 1;

  // Loop through files in directory
  await for (var entity in directory.list()) {
    if (entity is File) {
      String extension = entity.path.split('.').last;

      String newPath = "${directory.path}/file_$count.$extension";

      await entity.rename(newPath);

      print("Renamed: ${entity.path} -> $newPath");

      count++;
    }
  }

  print("Renaming completed.");
}