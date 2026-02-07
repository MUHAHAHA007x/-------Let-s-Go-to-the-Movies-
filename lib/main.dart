import 'package:flutter/material.dart';
import 'http_helper.dart';

void main() => runApp(const MyMovies());

class MyMovies extends StatelessWidget {
  const MyMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movies',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const MovieList(),
    );
  }
}

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  HttpHelper helper = HttpHelper();
  List? movies;

  @override
  void initState() {
    super.initState();
    // เรียกใช้ฟังก์ชันดึงข้อมูลเมื่อเริ่มแอป
    helper.getUpcoming().then((value) {
      setState(() {
        movies = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upcoming Movies')),
      body: ListView.builder(
        itemCount: (movies == null) ? 0 : movies!.length,
        itemBuilder: (BuildContext context, int position) {
          return ListTile(
            title: Text(movies![position].title),
            subtitle: Text('Released: ${movies![position].releaseDate}'),
            // สามารถเพิ่ม Image.network มาโชว์รูปได้ที่นี่ค่ะ
          );
        },
      ),
    );
  }
}
