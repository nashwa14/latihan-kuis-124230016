import 'package:url_launcher/url_launcher.dart';

/// Membuka link URL menggunakan url_launcher
Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception("Tidak bisa membuka $url");
  }
}
