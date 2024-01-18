import 'package:flutter/material.dart';
import 'package:flutter_firebase_1/services/firestore.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final FirestoreServices firestoreServices = FirestoreServices();

  final TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   _controller = TextEditingController();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Add Notes'),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.black,
              minWidth: double.infinity,
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                firestoreServices.addNote(_controller.text);
                _controller.clear();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
