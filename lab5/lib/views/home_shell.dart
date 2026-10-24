import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/photos_view_model.dart';
import '../viewmodels/theme_view_model.dart';
import '../viewmodels/wishlist_view_model.dart';
import 'photos_screen.dart';
import 'wishlist_photo_screen.dart';

class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  int _index = 0;

  Future<void> _toggleTheme() async {
    try {
      await ref.read(themeViewModelProvider.notifier).toggleTheme();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không thể lưu Theme Mode: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(wishlistViewModelProvider);
    final theme = ref.watch(themeViewModelProvider);
    final isDark = theme.asData?.value == ThemeMode.dark;
    final favoriteCount = favorites.asData?.value.length ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(_index == 0 ? 'Danh sách Photos' : 'WishListPhoto'),
        actions: [
          if (_index == 0)
            IconButton(
              tooltip: 'Tải lại từ API',
              onPressed: () {
                ref.read(photosViewModelProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh),
            ),
          IconButton(
            tooltip: isDark ? 'Chế độ sáng' : 'Chế độ tối',
            onPressed: theme.isLoading ? null : _toggleTheme,
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: IndexedStack(
        index: _index,
        children: const [PhotosScreen(), WishListPhotoScreen()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (index) {
          setState(() => _index = index);
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.photo_library_outlined),
            selectedIcon: Icon(Icons.photo_library),
            label: 'Photos',
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_outline),
            selectedIcon: const Icon(Icons.favorite),
            label: 'WishList ($favoriteCount)',
          ),
        ],
      ),
    );
  }
}
