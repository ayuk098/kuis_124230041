import 'package:flutter/material.dart';
import 'package:kuis_124230041/data/movie_data.dart';
import 'package:kuis_124230041/screens/detail_page.dart';
import 'package:kuis_124230041/screens/login_page.dart';

// Halaman Home setelah login
class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 254, 254, 255),
          ),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        automaticallyImplyLeading:
            false, // biar tombol back default nggak muncul
        actions: [
          // Icon logout
          IconButton(
            icon: Icon(Icons.logout_outlined, color: Colors.white),
            onPressed: () {
              _logout(context); // panggil fungsi logout
            },
          ),
        ],
      ),

      // Bagian isi halaman
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Welcome $username",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Sub teks
            Text(
              "Silahkan pilih movie dibawah ini",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.blue[900],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: _movie(context, index),
                    ),
                  );
                },
                itemCount: (12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk logout
  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
      (route) => false,
    );
  }

  // Widget untuk menampilkan 1 item game di grid
  Widget _movie(context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(movie: movieList[index]);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.orange),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar movie
            Container(
              height: 100,
              width: double.infinity,
              child: Image.network(movieList[index].imgUrl, fit: BoxFit.cover),
            ),

            SizedBox(height: 8),

            // Nama movie
            Text(
              movieList[index].title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue[900],
              ),
            ),

            // genre
            Text(
              movieList[index].genre,
              style: TextStyle(
                color: const Color.fromARGB(255, 108, 100, 100),
                fontSize: 15,
              ),
            ),

            SizedBox(height: 8),

            // Baris untuk review + harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Review Average",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
              ],
            ),
            // Nilai review average
            Text(
              "${movieList[index].rating.toString()} /10",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 246, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
