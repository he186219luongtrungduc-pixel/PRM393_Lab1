import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/photo_api_repository.dart';
import '../data/photo_local_repository.dart';
import '../data/theme_repository.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
PhotoApiRepository photoApiRepository(Ref ref) {
  final client = http.Client();
  ref.onDispose(client.close);
  return PhotoApiRepository(client);
}

@Riverpod(keepAlive: true)
PhotoLocalRepository photoLocalRepository(Ref ref) {
  return PhotoLocalRepository();
}

@Riverpod(keepAlive: true)
ThemeRepository themeRepository(Ref ref) {
  return ThemeRepository();
}
