// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(photoApiRepository)
final photoApiRepositoryProvider = PhotoApiRepositoryProvider._();

final class PhotoApiRepositoryProvider
    extends
        $FunctionalProvider<
          PhotoApiRepository,
          PhotoApiRepository,
          PhotoApiRepository
        >
    with $Provider<PhotoApiRepository> {
  PhotoApiRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoApiRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoApiRepositoryHash();

  @$internal
  @override
  $ProviderElement<PhotoApiRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PhotoApiRepository create(Ref ref) {
    return photoApiRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhotoApiRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhotoApiRepository>(value),
    );
  }
}

String _$photoApiRepositoryHash() =>
    r'82a0ba159fbe85cbe2f9b36418e243a1b852e4b7';

@ProviderFor(photoLocalRepository)
final photoLocalRepositoryProvider = PhotoLocalRepositoryProvider._();

final class PhotoLocalRepositoryProvider
    extends
        $FunctionalProvider<
          PhotoLocalRepository,
          PhotoLocalRepository,
          PhotoLocalRepository
        >
    with $Provider<PhotoLocalRepository> {
  PhotoLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoLocalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<PhotoLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PhotoLocalRepository create(Ref ref) {
    return photoLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhotoLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhotoLocalRepository>(value),
    );
  }
}

String _$photoLocalRepositoryHash() =>
    r'259c7d7e9a3b3336f0109d1e6a6eae4c79de89a3';

@ProviderFor(themeRepository)
final themeRepositoryProvider = ThemeRepositoryProvider._();

final class ThemeRepositoryProvider
    extends
        $FunctionalProvider<ThemeRepository, ThemeRepository, ThemeRepository>
    with $Provider<ThemeRepository> {
  ThemeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeRepositoryHash();

  @$internal
  @override
  $ProviderElement<ThemeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeRepository create(Ref ref) {
    return themeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeRepository>(value),
    );
  }
}

String _$themeRepositoryHash() => r'3c20db76819dedbf3994680ca4a55b99ca96c7e7';
