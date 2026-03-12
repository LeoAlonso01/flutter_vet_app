import 'package:flutter/material.dart';
import 'database/database_helper.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseHelper.instance.database;

  runApp(const VetHospitalApp());
}

class VetHospitalApp extends StatelessWidget {
  const VetHospitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Veterinario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospital Veterinario 🐾"),
      ),
      body: const Center(
        child: Text(
          "Sistema Veterinario",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );

  }
}