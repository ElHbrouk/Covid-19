import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:covid_19/screens/image_pick.dart';

var error;
var resultProbVgg;
var resultStatusVgg;

class ModelService {
  ImagePicker photo = ImagePicker();
  upload() async {
    var img = await photo.pickFile();
    if (img == null) {
      return;
    }
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(
        'http://192.168.1.3:4444/api',
      ),
    );
    request.files.add(
      await http.MultipartFile.fromPath("image", img),
    );
    var response = await request.send();
    var responseStream = await response.stream.bytesToString();
    var body = jsonDecode(responseStream);
    var probVgg = body['vgg']['Probability'];
    var statusVgg = body['vgg']['Status'];
    resultProbVgg = probVgg;
    resultStatusVgg = statusVgg;
    return statusVgg;
  }
}
