import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kontrola_serwisowa/app/features/home/add_wydatki_page_content/add_wydatki_page_content.dart';
import 'package:kontrola_serwisowa/app/features/home/contact_page_content/contact_page_content.dart';
import 'package:kontrola_serwisowa/app/features/home/my_account_page_content/my_account_page_content.dart';
import 'package:kontrola_serwisowa/app/features/home/wydatki_page_content/wydatki_page_content.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const WydatkiPageContent();
        }
        if (currentIndex == 1) {
          return AddWydatkiPageContent(
            onSave: () {
              setState(
                () {
                  currentIndex = 0;
                },
              );
            },
          );
        }
        if (currentIndex == 2) {
          return const ContactPageContent();
        }

        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Wydatki',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Dodaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Kontakt',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}
