import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis_124230041/model/movie_model.dart';

class DetailPage extends StatelessWidget {
  final MovieModel movie;
  const DetailPage({super.key, required this.movie});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text(
          'Movie Details',
          style: TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.blue[700],
        elevation: 0, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // rata kiri
            children: [
              Container(
                height: 750,
                width: double.infinity,
                color: Colors.grey[300],
                child: Image.network(movie.imgUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 12),

              Text(
                movie.title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),

              Text(
                movie.director,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(height: 8),

          
              Text(movie.synopsis, style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 12),

          
              Text(
                "Genre : ${movie.genre}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // casts
              Text(
                "Casts : ${movie.casts.join(', ')}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),
             
              Text(
                "Rated  ${movie.rating} /10",
                style: TextStyle(
                  color: const Color.fromARGB(255, 192, 21, 21),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    _launchURL(movie.movieUrl);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: const Text("Go To Wikipedia"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
