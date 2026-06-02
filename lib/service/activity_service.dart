import 'dart:convert';
import 'package:flutter_application/data/classes/activity_class.dart';
import 'package:http/http.dart' as http;

class ActivityService {
  static const String baseUrl = 'https://bored-api.appbrewery.com/random';

  Future<Activity> fetchActivity() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return Activity.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw Exception(
      'Failed to load activity. Status code: ${response.statusCode}',
    );
  }
}
