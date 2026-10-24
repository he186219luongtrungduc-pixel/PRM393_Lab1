import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/wishlist_view_model.dart';
import '../widgets/photo_tile.dart';

class WishListPhotoScreen extends ConsumerWidget {
  const WishListPhotoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wishlistViewModelProvider);
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Không thể đọc dữ liệu SQLite: $error'),
      ),
      data: (photos) {
        if (photos.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite_border, size: 56),
                SizedBox(height: 12),
                Text('Chưa có ảnh nào trong WishList.'),
                SizedBox(height: 6),
                Text('Mở Photos và nhấn trái tim để lưu ảnh.'),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return PhotoTile(
              key: ValueKey(photo.id),
              photo: photo,
              isFavorite: true,
              onToggle: () {
                return ref
                    .read(wishlistViewModelProvider.notifier)
                    .remove(photo.id);
              },
            );
          },
        );
      },
    );
  }
}
