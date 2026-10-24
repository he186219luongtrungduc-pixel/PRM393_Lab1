import 'package:flutter_test/flutter_test.dart';
import 'package:lab5_photo_app/models/photo.dart';

void main() {
  test('Photo.fromJson parse du 5 thuoc tinh', () {
    final photo = Photo.fromJson({
      'albumId': 3,
      'id': 21,
      'title': 'Anh kiem thu',
      'url': 'https://example.com/600',
      'thumbnailUrl': 'https://example.com/150',
    });

    expect(photo.id, 21);
    expect(photo.albumId, 3);
    expect(photo.title, 'Anh kiem thu');
    expect(photo.thumbnailUrl, 'https://example.com/150');
  });

  test('Photo.toDatabase / fromDatabase giu nguyen du lieu', () {
    const photo = Photo(
      albumId: 1,
      id: 2,
      title: 'Test title',
      url: 'https://example.com/600',
      thumbnailUrl: 'https://example.com/150',
    );

    final fromDb = Photo.fromDatabase(photo.toDatabase());
    expect(fromDb.id, photo.id);
    expect(fromDb.title, photo.title);
    expect(fromDb.url, photo.url);
  });
}
