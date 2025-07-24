class University {
  final String name;
  final String country;
  final String alpha_two_code;
  final List<String> webPages;

  University({
    required this.name,
    required this.country,
    required this.alpha_two_code,
    required this.webPages,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'] as String,
      country: json['country'] as String,
      alpha_two_code: json['alpha_two_code'] as String,
      webPages: List<String>.from(json['web_pages'] ?? []),
    );
  }
}
