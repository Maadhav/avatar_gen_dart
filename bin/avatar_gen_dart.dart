import 'dart:io';

import 'package:avatar_gen_dart/avatar_gen_dart.dart' as avatar_gen;
import 'package:color/color.dart';

void main() {
  var colors = avatar_gen.randomColorMaker();
  var input  = stdin.readLineSync();
  var image = avatar_gen.writeImage(input,main:HexColor(colors['main']).toRgbColor(),neg:HexColor(colors['neg']).toRgbColor());
  print(image.path);
}
