import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.facebook.com/');
final Uri _urll = Uri.parse('tel:+1-555-010-999');
final Uri _urlll =
    Uri.parse('mailto:smith@example.org?subject=News&body=New%20plugin');

class ContactPageContent extends StatelessWidget {
  const ContactPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('images/zdjecie.jpg'),
            radius: 150,
          ),
          const SizedBox(height: 50),
          Text(
            'Paweł Zakrzewski-Szofer',
            style: GoogleFonts.poppins(fontSize: 30),
          ),
          const SizedBox(height: 10),
          Text(
            'Flutter developer',
            style: GoogleFonts.italianno(fontSize: 40),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                IconButton(
                  onPressed: _launchEmail,
                  icon: Icon(Icons.alternate_email),
                ),
                IconButton(
                  onPressed: _makePhone,
                  icon: Icon(Icons.phone),
                ),
                IconButton(
                  onPressed: _launchUrl,
                  icon: Icon(Icons.facebook),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _launchUrl() async {
  if (!await launchUrl(_url)) throw "Could not launch $_url";
}

void _makePhone() async {
  if (!await launchUrl(_urll)) throw "Could not launch $_urll";
}

void _launchEmail() async {
  if (!await launchUrl(_urlll)) throw "Could not launch $_urlll";
}
