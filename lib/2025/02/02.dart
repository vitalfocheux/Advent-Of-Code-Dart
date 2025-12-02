// Advent of Code 2025 - Day 02
import 'package:root_utils/root_utils.dart';

void main() async {
  AOCD aocd = await AOCD.create(2025, 02); 
  // print(part1(aocd.asStr));
  print(part2(aocd.asStr));
}

dynamic part1(String input) {
  int res = 0;
  for(String line in input.split(',')){
    List<int> ids = line.findIntList();
    int startId = ids[0].abs();
    int endId = ids[1].abs();
    // print("$startId-$endId:");
    for(int id = startId; id <= endId; id++){
      // print(id);
      if(isInvalidID(id)){
        res += id;
        // print(id);
      }
    }
  }
  return res;
}

dynamic part2(String input) {
int res = 0;
  for(String line in input.split(',')){
    List<int> ids = line.findIntList();
    int startId = ids[0].abs();
    int endId = ids[1].abs();
    for(int id = startId; id <= endId; id++){
      if(isInvalidIDAtLeastTwice(id)){
        res += id;
      }
    }
  }
  return res;
}

bool isInvalidID(int n){
  if(n.toString().length % 2 != 0){
    return false;
  }
  String s = n.toString();
  int halfLen = s.length ~/ 2;
  String firstHalf = s.substring(0, halfLen);
  String secondHalf = s.substring(halfLen);
  if(firstHalf != secondHalf){
    return false;
  }
  return true;
}

bool isInvalidIDAtLeastTwice(int n){
  String s = n.toString();
  int len = s.length;

  for(int halfLen = 1; halfLen <= len ~/ 2; halfLen++){
    if(len % halfLen != 0){
      continue;
    }
    String firstPart = s.substring(0, halfLen);
    String secondPart = s.substring(halfLen, len);
    if(firstPart == secondPart){
      return true;
    }
    for(int i = 0; i < secondPart.length; i += halfLen){
      String part = secondPart.substring(i, i + halfLen);
      if(part != firstPart){
        break;
      }
      if(i + halfLen >= secondPart.length){
        return true;
      }
    }
  }

  return false;
}