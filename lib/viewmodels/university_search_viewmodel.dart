import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/university.dart';

final universitySuggestionsProvider = FutureProvider.family<List<University>, String>((ref, pattern) async {
  if (pattern.trim().isEmpty) {
    return [];
  }
  final encodedPattern = Uri.encodeQueryComponent(pattern);
  final uri = Uri.parse('http://universities.hipolabs.com/search?name=$encodedPattern');

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    return data.map((e) => University.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load university suggestions');
  }
});
