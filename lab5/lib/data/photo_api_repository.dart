import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/photo.dart';

class PhotoApiRepository {
  const PhotoApiRepository(this._client);

  final http.Client _client;
  static final Uri _photosUri = Uri.parse(
    'https://jsonplaceholder.typicode.com/photos',
  );

  Future<List<Photo>> fetchPhotos() async {
    final response = await _client.get(_photosUri).timeout(
      const Duration(seconds: 25),
    );

    if (response.statusCode != 200) {
      throw Exception('Lỗi API: HTTP ${response.statusCode}');
    }

    final decoded = jsonDecode(utf8.decode(response.bodyBytes));
    if (decoded is! List) {
      throw const FormatException('API không trả về danh sách Photo.');
    }

    return decoded.map((item) {
      return Photo.fromJson(Map<String, dynamic>.from(item as Map));
    }).toList(growable: false);
  }
}
