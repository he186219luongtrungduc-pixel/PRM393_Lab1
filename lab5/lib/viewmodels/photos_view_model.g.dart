// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhotosViewModel)
final photosViewModelProvider = PhotosViewModelProvider._();

final class PhotosViewModelProvider
    extends $AsyncNotifierProvider<PhotosViewModel, List<Photo>> {
  PhotosViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photosViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photosViewModelHash();

  @$internal
  @override
  PhotosViewModel create() => PhotosViewModel();
}

String _$photosViewModelHash() => r'298122e77a7ce95f873f4a5301c6f3a0e58fc1a9';

abstract class _$PhotosViewModel extends $AsyncNotifier<List<Photo>> {
  FutureOr<List<Photo>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Photo>>, List<Photo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Photo>>, List<Photo>>,
              AsyncValue<List<Photo>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
