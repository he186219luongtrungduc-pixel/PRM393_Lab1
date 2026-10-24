class Photo {
  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }

  factory Photo.fromDatabase(Map<String, Object?> row) {
    return Photo(
      albumId: row['albumId'] as int,
      id: row['id'] as int,
      title: row['title'] as String,
      url: row['url'] as String,
      thumbnailUrl: row['thumbnailUrl'] as String,
    );
  }

  Map<String, Object?> toDatabase() => {
    'id': id,
    'albumId': albumId,
    'title': title,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
  };
}
