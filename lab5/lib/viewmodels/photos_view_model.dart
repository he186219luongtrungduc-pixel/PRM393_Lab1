import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/repository_providers.dart';
import '../models/photo.dart';

part 'photos_view_model.g.dart';

@Riverpod(keepAlive: true)
class PhotosViewModel extends _$PhotosViewModel {
  @override
  Future<List<Photo>> build() {
    return ref.watch(photoApiRepositoryProvider).fetchPhotos();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(photoApiRepositoryProvider).fetchPhotos(),
    );
  }
}
