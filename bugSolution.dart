```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        final name = jsonData['name'];
        if(name != null) {
          print('Name: $name');
        } else {
          print('Error: Name field missing in JSON response');
        }
      } catch (e) {
        print('Error: Invalid JSON response: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```