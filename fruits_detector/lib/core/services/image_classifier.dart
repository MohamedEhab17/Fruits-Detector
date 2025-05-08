import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class ImageClassifier {
  final String apiUrl = 'http://192.168.1.3:5000/predict';
  Future<Map<String, dynamic>> predict(File imageFile) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath('image', imageFile.path),
      );

      var response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        return jsonDecode(responseBody);
      } else {
        log('API Error: $responseBody');
        return {'error': 'Server error: ${response.statusCode}'};
      }
    } catch (e) {
      log('Prediction failed: $e');
      return {'error': e.toString()};
    }
  }
}
