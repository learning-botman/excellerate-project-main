class Program {
  final String id;
  final String title;
  final String description;
  final String instructor;
  final String duration;
  final String level;
  final List<String> topics;
  final String imageUrl;
  final double rating;
  final int enrolledCount;
  final String lastUpdated;

  Program({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.duration,
    required this.level,
    required this.topics,
    required this.imageUrl,
    required this.rating,
    required this.enrolledCount,
    required this.lastUpdated,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      instructor: json['instructor'] as String,
      duration: json['duration'] as String,
      level: json['level'] as String,
      topics: List<String>.from(json['topics'] as List),
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      enrolledCount: json['enrolledCount'] as int,
      lastUpdated: json['lastUpdated'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'instructor': instructor,
        'duration': duration,
        'level': level,
        'topics': topics,
        'imageUrl': imageUrl,
        'rating': rating,
        'enrolledCount': enrolledCount,
        'lastUpdated': lastUpdated,
      };
}