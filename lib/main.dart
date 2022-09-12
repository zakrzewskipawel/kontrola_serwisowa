import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kontrola_serwisowa/app.dart';
import 'package:kontrola_serwisowa/firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
