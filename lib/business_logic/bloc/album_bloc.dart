import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/album_model.dart';
import '../../data/models/photo_model.dart';
import '../../data/repositories/album_repository.dart';

// Events
abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class LoadAlbums extends AlbumEvent {}

class LoadAlbumPhotos extends AlbumEvent {
  final int albumId;

  const LoadAlbumPhotos(this.albumId);

  @override
  List<Object> get props => [albumId];
}

// States
abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<AlbumModel> albums;

  const AlbumLoaded(this.albums);

  @override
  List<Object> get props => [albums];
}

class AlbumError extends AlbumState {
  final String message;

  const AlbumError(this.message);

  @override
  List<Object> get props => [message];
}

class AlbumPhotosLoading extends AlbumState {}

class AlbumPhotosLoaded extends AlbumState {
  final List<PhotoModel> photos;

  const AlbumPhotosLoaded(this.photos);

  @override
  List<Object> get props => [photos];
}

class AlbumPhotosError extends AlbumState {
  final String message;

  const AlbumPhotosError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc({required this.repository}) : super(AlbumInitial()) {
    on<LoadAlbums>(_onLoadAlbums);
    on<LoadAlbumPhotos>(_onLoadAlbumPhotos);
  }

  Future<void> _onLoadAlbums(LoadAlbums event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      final albums = await repository.getAlbums();
      emit(AlbumLoaded(albums));
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }

  Future<void> _onLoadAlbumPhotos(LoadAlbumPhotos event, Emitter<AlbumState> emit) async {
    emit(AlbumPhotosLoading());
    try {
      final photos = await repository.getPhotosByAlbumId(event.albumId);
      emit(AlbumPhotosLoaded(photos));
    } catch (e) {
      emit(AlbumPhotosError(e.toString()));
    }
  }
} 