// File: lib/genera_year.dart
// Script pour générer la structure d'un année Advent of Code.
// Usage: dart run lib/genera_year.dart
import 'dart:io';

void main() {
  stdout.write('Année (ex: 2021) : ');
  final yearInput = stdin.readLineSync() ?? '';
  final year = int.tryParse(yearInput);
  if (year == null) {
    stderr.writeln('Année invalide.');
    exit(2);
  }

  stdout.write('Nombre de jours (ex: 25) : ');
  final daysInput = stdin.readLineSync() ?? '';
  final days = int.tryParse(daysInput);
  if (days == null || days <= 0) {
    stderr.writeln('Nombre de jours invalide.');
    exit(2);
  }

  final libYearDir = Directory('$year');

  _createDir(libYearDir);

  // Génère chaque fichier dayXX.dart, test et input vide si absent.
  for (var i = 1; i <= days; i++) {
    final idx = i.toString().padLeft(2, '0');
    final dayFile = File('${libYearDir.path}/$idx/$idx.dart');

    _createFileIfNotExist(dayFile, _dayTemplate(year, idx));
  }


}

void _createDir(Directory dir) {
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
    stdout.writeln('Créé: ${dir.path}');
  }
}

void _createFileIfNotExist(File file, String content) {
  if (file.existsSync()) {
    stdout.writeln('Existant (skip) : ${file.path}');
    return;
  }
  file.createSync(recursive: true);
  file.writeAsStringSync(content);
  stdout.writeln('Créé: ${file.path}');
}

String _dayTemplate(int year, String idx) => '''
// Advent of Code $year - Day $idx
import 'package:root_utils/root_utils.dart';

void main() async {
  AOCD aocd = await AOCD.create($year, $idx); 
  print(part1(aocd.asStr));
  print(part2(aocd.asStr));
}

dynamic part1(String input) {
  // TODO: implémenter la solution de la partie 1
  return null;
}

dynamic part2(String input) {
  // TODO: implémenter la solution de la partie 2
  return null;
}
''';