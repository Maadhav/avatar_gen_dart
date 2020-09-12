import 'dart:io';
import 'dart:math';
import 'package:color/color.dart';
import 'package:image/image.dart';

File writeImage(String text, {RgbColor main, RgbColor neg}) {
  var image = Image(100, 100), letters;
  if (text.split(' ').length > 1) {
    letters = text.split(' ')[0][0] + text.split(' ')[1][0];
  } else {
    letters = text.substring(0, 2);
  }
  fill(image, getColor(main.r, main.g, main.b));
  print(letters);
  drawString(image, arial_48, 13, 30, letters.toUpperCase(),
      color: getColor(neg.r, neg.g, neg.b));
  var resultFile = File('test.png');
  resultFile.writeAsBytesSync(encodePng(image));
  return resultFile;
}

Map randomColorMaker() {
  var length = 6, chars = '0123456789ABCDEF', hex = '';
  while (length-- > 0) {
    hex += chars[(Random().nextInt(16)) | 0];
  }
  final number = int.parse('00' + hex, radix: 16);
  var neg = (16777215 - number).toRadixString(16);
  var map = {'main': hex, 'neg': neg};
  print(map);
  return map;
}
