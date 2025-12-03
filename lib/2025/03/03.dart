// Advent of Code 2025 - Day 03
import 'package:root_utils/root_utils.dart';

void main() async {
  AOCD aocd = await AOCD.create(2025, 03); 
  print(part1(aocd.asStr));
  print(part2(aocd.asStr));
}

Iterable<List<T>> combinations<T>(List<T> items, int k) sync* {
  final n = items.length;
  if (k < 0 || k > n) return;
  if (k == 0) {
    yield <T>[];
    return;
  }
  final indices = List<int>.generate(k, (i) => i);
  while (true) {
    yield indices.map((i) => items[i]).toList(growable: false);
    var i = k - 1;
    while (i >= 0 && indices[i] == i + n - k) {
      i--;
    }
    if (i < 0) break;
    indices[i]++;
    for (var j = i + 1; j < k; j++) {
      indices[j] = indices[j - 1] + 1;
    }
  }
}

dynamic part1(String input) {
  int res = 0;
  for(String line in input.split('\n')){
    List<int> numbers = line.split('').map(int.parse).toList();
    List<int> nums = [];
    for(var combs in combinations(numbers, 2)){
      nums.add(combs[0] * 10 + combs[1]);
    }
    res += nums.max();
  }
  return res;
}

dynamic part2(String input) {
  num res = 0;
  for(String line in input.split('\n')){
    List<int> numbers = line.split('').map(int.parse).toList();
    int start = 0;
    int r = 0;
    for(int i = 12; i > 0; i--){
      
      List<int> current;
      if(i == -1){
        current = numbers.sublist(start, numbers.length);
      }else{
        current = numbers.sublist(start, numbers.length -(i-1));
      }
      
      int max = current.max();
      start = numbers.indexOf(max, start) + 1;
      r = r * 10 + max;
      
    }
    res += r;
  }
  return res;
}