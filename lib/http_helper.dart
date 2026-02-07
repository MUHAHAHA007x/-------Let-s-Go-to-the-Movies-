import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'movie.dart';

class HttpHelper {
  final String urlKey = 'api_key=dbf9af4b5d92827855333469e66ed6e1';
  final String urlBase = 'https://api.themoviedb.org/3/movie/upcoming?';

  Future<List<Movie>?> getUpcoming() async {
    final String upcoming = urlBase + urlKey;
    // ปรับเป็น Uri.parse() เพื่อให้ใช้งานได้กับเวอร์ชันปัจจุบัน
    http.Response result = await http.get(Uri.parse(upcoming));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final List moviesMap = jsonResponse['results'];
      List<Movie> movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
