import 'package:flutter/material.dart';
import 'package:flutter_firebase_1/screens/addNotes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Notes'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNotesScreen();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
