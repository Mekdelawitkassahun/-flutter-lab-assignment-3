import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album_model.dart';
import '../models/photo_model.dart';

class ApiService {
  final String baseUrl;
  final http.Client _httpClient;

  ApiService({this.baseUrl = "https://jsonplaceholder.typicode.com"})
      : _httpClient = http.Client();

  Future<List<AlbumModel>> getAlbums() async {
    final response = await _httpClient.get(Uri.parse('$baseUrl/albums'));
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => AlbumModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums: ${response.statusCode}');
    }
  }

  Future<List<PhotoModel>> getPhotos() async {
    final response = await _httpClient.get(Uri.parse('$baseUrl/photos'));
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos: ${response.statusCode}');
    }
  }

  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    final response = await _httpClient.get(
      Uri.parse('$baseUrl/photos?albumId=$albumId'),
    );
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos: ${response.statusCode}');
    }
  }

  void dispose() {
    _httpClient.close();
  }
} 