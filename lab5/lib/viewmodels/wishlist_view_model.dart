import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/repository_providers.dart';
import '../models/photo.dart';

part 'wishlist_view_model.g.dart';

@Riverpod(keepAlive: true)
class WishlistViewModel extends _$WishlistViewModel {
  // Serialize writes so two quick taps cannot overwrite the displayed state.
  Future<void> _lastMutation = Future<void>.value();

  Future<void> _runInOrder(Future<void> Function() action) {
    final current = _lastMutation.then((_) => action());
    _lastMutation = current.then(
      (_) {},
      onError: (Object error, StackTrace stackTrace) {},
    );
    return current;
  }

  @override
  Future<List<Photo>> build() {
    return ref.watch(photoLocalRepositoryProvider).getWishlist();
  }

  Future<void> toggle(Photo photo) => _runInOrder(() async {
    final repository = ref.read(photoLocalRepositoryProvider);
    if (await repository.contains(photo.id)) {
      await repository.remove(photo.id);
    } else {
      await repository.save(photo);
    }
    state = AsyncData(await repository.getWishlist());
  });

  Future<void> remove(int photoId) => _runInOrder(() async {
    final repository = ref.read(photoLocalRepositoryProvider);
    await repository.remove(photoId);
    state = AsyncData(await repository.getWishlist());
  });
}
