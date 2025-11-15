import 'package:root_utils/root_utils.dart';

void main() async {
  AOCD aocd = await AOCD.create(2015, 1); 
  print(part1(aocd.asStr));
  print(part2(aocd.asStr));
}

int part1(String input){
  return ('('.allMatches(input).length - ')'.allMatches(input).length).abs();
}

int part2(String parser){
  int res = 0, floor = 0;
  
  for (int i = 0; i < parser.length; i++) {
    if (parser[i] == '(') {
      floor++;
    } else if (parser[i] == ')') {
      floor--;
    }
    if (floor == -1) {
      res = i + 1;
      break;
    }
  }

  return res;
}