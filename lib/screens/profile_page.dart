import 'package:flutter/material.dart';

// Halaman Profile
class ProfilePage extends StatelessWidget {
  final String username; // data username dari LoginPage/HomePage

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.pink[200], // pastel appbar
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout → kembali ke halaman login
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar bulat
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.pink[100],
              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Username
            Text(
              username,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),
            // Email dummy
            Text(
              "$username@example.com",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 20),
            // Card info
            Card(
              color: Colors.blue[50],
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.pink),
                title: const Text("Pengaturan Akun"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Fitur pengaturan belum tersedia")),
                  );
                },
              ),
            ),
            Card(
              color: Colors.green[50],
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.pink),
                title: const Text("Tentang Aplikasi"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: "Movie App",
                    applicationVersion: "1.0.0",
                    children: [
                      const Text("Aplikasi sederhana untuk latihan prak mobile."),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
