import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddWydatkiPageContent extends StatefulWidget {
  const AddWydatkiPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddWydatkiPageContent> createState() => _AddWydatkiPageContentState();
}

class _AddWydatkiPageContentState extends State<AddWydatkiPageContent> {
  var data = '';
  var course = '';
  var name = '';
  var cost = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Data',
            ),
            onChanged: (newValue) {
              data = newValue;
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj przebieg',
            ),
            onChanged: (newValue) {
              course = newValue;
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Tytuł wydatku',
            ),
            onChanged: (newValue) {
              name = newValue;
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Koszt',
            ),
            onChanged: (newValue) {
              cost = newValue;
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('wydatki_samochod').add({
                'data': data,
                'course': course,
                'name': name,
                'cost': cost,
              });
              widget.onSave();
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
