import 'package:flutter/material.dart';
import 'package:latihan_kuis_prak_mobile_124230016/models/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

// Halaman detail film
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  // Fungsi untuk buka link eksternal (Wikipedia/IMDb)
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Tidak bisa membuka $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data film dari arguments
    final movie = ModalRoute.of(context)!.settings.arguments as MovieModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.pink[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster film
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(movie.imgUrl, height: 300),
              ),
            ),
            const SizedBox(height: 16),
            // Judul + tahun
            Text(
              "${movie.title} (${movie.year})",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Informasi tambahan
            Text("Genre: ${movie.genre}"),
            Text("Director: ${movie.director}"),
            Text("Rating: ${movie.rating}"),
            const SizedBox(height: 10),
            Text("Casts: ${movie.casts.join(", ")}"),
            const SizedBox(height: 10),
            // Sinopsis
            Text(
              "Synopsis:",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(movie.synopsis),
            const SizedBox(height: 20),
            // Tombol buka link eksternal
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300],
              ),
              onPressed: () => _launchURL(movie.movieUrl),
              icon: const Icon(Icons.open_in_new),
              label: const Text("Lihat di Wikipedia/IMDb"),
            ),
          ],
        ),
      ),
    );
  }
}
