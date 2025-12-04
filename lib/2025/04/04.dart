// Advent of Code 2025 - Day 04
import 'package:root_utils/root_utils.dart';

void main() async {
  AOCD aocd = await AOCD.create(2025, 04); 
  print(part1(aocd.asStr));
  print(part2(aocd.asStr));
}

dynamic part1(String input) {
  var res = 0;
  Matrix2<String> matrix = Matrix2.fromString(input, '\n', '');
  matrix.iterate((value, vector) {
      if(value != '@'){
        return;
      }
      int adjacentCount = 0;
      matrix.iterateAround8(vector, (v, vec) {
        if(v == '@'){
          adjacentCount++;
        }
      });
      if(adjacentCount < 4){
        res++;
      }
    });
  return res;
}

dynamic part2(String input) {
  var res = 0;
  List<(int, int)> toRemove = [];
  Matrix2<String> matrix = Matrix2.fromString(input, '\n', '');
  while(true){
    matrix.iterate((value, vector) {
      if(value != '@'){
        return;
      }
      int adjacentCount = 0;
      matrix.iterateAround8(vector, (v, vec) {
        if(v == '@'){
          adjacentCount++;
        }
      });
      if(adjacentCount < 4){
        toRemove.add(vector);
      }
    });
    if(toRemove.isEmpty){
      break;
    }
    for((int, int) v in toRemove){
      matrix[v] = '.';
    }
    res += toRemove.length;
    toRemove.clear();
  }
  return res;
}