import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/photo.dart';
import '../viewmodels/photos_view_model.dart';
import '../viewmodels/wishlist_view_model.dart';
import '../widgets/photo_tile.dart';

class PhotosScreen extends ConsumerStatefulWidget {
  const PhotosScreen({super.key});

  @override
  ConsumerState<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends ConsumerState<PhotosScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final photosState = ref.watch(photosViewModelProvider);
    final wishlistState = ref.watch(wishlistViewModelProvider);
    final favoriteIds = (wishlistState.asData?.value ?? const <Photo>[])
        .map((photo) => photo.id)
        .toSet();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
          child: TextField(
            onChanged: (value) {
              setState(() => _query = value.trim().toLowerCase());
            },
            decoration: InputDecoration(
              hintText: 'Tìm ảnh theo tiêu đề hoặc ID',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
        Expanded(
          child: photosState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.wifi_off, size: 40),
                  const SizedBox(height: 12),
                  const Text('Không tải được danh sách Photo.'),
                  const SizedBox(height: 8),
                  Text('$error', textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () {
                      ref.read(photosViewModelProvider.notifier).refresh();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Thử lại'),
                  ),
                ],
              ),
            ),
            data: (photos) {
              final filtered = photos.where((photo) {
                return photo.title.toLowerCase().contains(_query) ||
                    photo.id.toString().contains(_query);
              }).toList(growable: false);

              if (filtered.isEmpty) {
                return const Center(child: Text('Không tìm thấy Photo phù hợp.'));
              }

              return RefreshIndicator(
                onRefresh: () {
                  return ref.read(photosViewModelProvider.notifier).refresh();
                },
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final photo = filtered[index];
                    return PhotoTile(
                      key: ValueKey(photo.id),
                      photo: photo,
                      isFavorite: favoriteIds.contains(photo.id),
                      enabled: !wishlistState.isLoading && !wishlistState.hasError,
                      onToggle: () {
                        return ref
                            .read(wishlistViewModelProvider.notifier)
                            .toggle(photo);
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
