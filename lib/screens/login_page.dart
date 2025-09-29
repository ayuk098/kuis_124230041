import 'package:flutter/material.dart';
import 'package:kuis_124230041/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk ambil teks dari TextField
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoginSucces = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 254, 254, 255),
          ),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/icons/profil.png", height: 150)),

            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Text(
                    "Username",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: const Color.fromARGB(255, 19, 47, 96),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                _usernameField(),
              ],
            ),
            SizedBox(height: 10),
            // Bagian Password
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: const Color.fromARGB(255, 19, 47, 96),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                _passwordField(),
              ],
            ),
            // Tombol Login
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  // TextField untuk Username
  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: usernameController, 
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: "Masukkan Username",
          hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
          fillColor: const Color.fromARGB(255, 252, 252, 252),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }


  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: "Masukkan Password",
          hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          print("Login");
          _login();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  // Fungsi untuk proses login
  void _login() {
    String text = "", username, password;

    username = usernameController.text.trim();
    password = passwordController.text.trim();
    print("Username : $username");
    print("Password : $password");

    if (username == "wahyuramadani" && password == "041") {
      setState(() {
        text = "LOGIN BERHASIL";
        isLoginSucces = true;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage(username: username);
          },
        ),
      );
    } else {
      setState(() {
        text = "LOGIN GAGAL";
      });
    }

    SnackBar snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
