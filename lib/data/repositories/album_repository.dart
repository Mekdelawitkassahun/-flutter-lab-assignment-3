import '../datasources/api_service.dart';
import '../models/album_model.dart';
import '../models/photo_model.dart';

class AlbumRepository {
  final ApiService apiService;

  AlbumRepository({required this.apiService});

  Future<List<AlbumModel>> getAlbums() async {
    return await apiService.getAlbums();
  }

  Future<List<PhotoModel>> getPhotos() async {
    return await apiService.getPhotos();
  }

  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    return await apiService.getPhotosByAlbumId(albumId);
  }
} 