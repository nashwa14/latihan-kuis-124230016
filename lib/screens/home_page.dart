import 'package:flutter/material.dart';
import 'package:latihan_kuis_prak_mobile_124230016/models/movie_model.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $username"),
        backgroundColor: Colors.pink[200], // warna pastel
        actions: [
          // Tombol profil
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/profile',
                arguments: username,
              );
            },
          ),
          // Tombol logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: movie);
            },
            child: Card(
              color: Colors.blue[50], // pastel card
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    movie.imgUrl,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  movie.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("${movie.year} | Rating: ${movie.rating}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
