// Advent of Code 2025 - Day 01
import 'package:root_utils/root_utils.dart';

void main() async {
  AOCD aocd = await AOCD.create(2025, 01); 
  print(part1(aocd.asStr));
  print(part2(aocd.asStr));
}

dynamic part1(String input) {
  int start = 50;
  int res = 0;
  for(String line in input.split('\n')){
    int add = line.findInt();
    if(line.contains('L')){
      start -= add;
    }else{
      start += add;
    
    }
    start = start % 100;
    // print("$line -> $start  ");
    if(start == 0){
      res++;
    }
  }
  return res;
}

dynamic part2(String input) {
  int turns = 0;
  int dial = 50;
  List<String> rotations = input.split('\n');
  for (final rot in rotations) {
    final int value = rot.findInt();
    final int clicks = value ~/ 100;    // quotient entier
    final int rotation = value % 100;   // reste

    turns += clicks;

    if (rot[0] == 'R') {
      if (dial + rotation >= 100) {
        turns += 1;
      }
      dial = (dial + rotation) % 100;
    } else {
      if (dial != 0 && dial - rotation <= 0) {
        turns += 1;
      }
      dial = (dial - rotation) % 100;
    }
  }
  return turns;
}
