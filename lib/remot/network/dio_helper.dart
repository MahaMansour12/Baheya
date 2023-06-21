import 'package:http/http.dart' as http;
Future<http.Response> ApiLink(Map<String,dynamic>data,String endPoint) async {
  final url = Uri.parse('https://baheya-app-kjsk.onrender.com/$endPoint');
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body:data,

  );
  if (response.statusCode == 200) {
    print('Login successful');
    print(response.statusCode);
    // Do something after login
  } else {
    print('Login failed');
    // Handle error
  }
  return response;
}

