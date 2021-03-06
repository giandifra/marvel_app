// Generate MD5 hash
import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';

generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}