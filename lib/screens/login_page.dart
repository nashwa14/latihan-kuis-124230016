import 'package:flutter/material.dart';
import 'package:latihan_kuis_prak_mobile_124230016/screens/home_page.dart';

// Halaman login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk input user
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Flag untuk status login
  bool isLoginSuccess = false;

  // Fungsi login sederhana dengan username=admin, password=1234
  void _login() {
    String message = "";
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == "admin" && password == "1234") {
      setState(() {
        message = "Login Berhasil";
        isLoginSuccess = true;
      });

      // Tampilkan snackbar warna hijau
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.green),
      );

      // Delay 0.5s agar snackbar sempat muncul sebelum pindah halaman
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(username: username)),
        );
      });
    } else {
      setState(() {
        message = "Login Gagal";
        isLoginSuccess = false;
      });

      // Snackbar merah jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul login
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Input password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true, // sembunyikan password
            ),
            const SizedBox(height: 20),
            // Tombol login
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300],
              ),
              onPressed: _login,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
