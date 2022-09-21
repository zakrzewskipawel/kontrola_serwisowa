// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kontrola_serwisowa/app/features/home/wydatki_page_content/cubit/wydatki_page_content_cubit.dart';

class UpdatePageContent extends StatefulWidget {
  const UpdatePageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatePageContent> createState() => _UpdatePageContentState();
}

TextEditingController nameConntroller = TextEditingController();
TextEditingController dataConntroller = TextEditingController();
TextEditingController mileageConntroller = TextEditingController();
TextEditingController costConntroller = TextEditingController();

_buildTextFiled(TextEditingController controller, String labelText) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        color: Colors.grey, border: Border.all(color: Colors.blue)),
    child: TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          border: InputBorder.none),
    ),
  );
}

class _UpdatePageContentState extends State<UpdatePageContent> {
  var data = '';
  var mileage = '';
  var name = '';
  var cost = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WydatkiPageContentCubit()..start(),
        child: BlocBuilder<WydatkiPageContentCubit, WydatkiPageContentState>(
            builder: (context, state) {
          // ignore: unused_local_variable
          final documentes = state.documentes;
        
          return Dialog(
              child: ListView(children: [
            for (final document in state.documentes) ...[
              _buildTextFiled(dataConntroller, 'Data'),
              const SizedBox(height: 10),
              _buildTextFiled(mileageConntroller, 'Podaj przebieg'),
              const SizedBox(height: 10),
              _buildTextFiled(nameConntroller, 'Tytuł wydatku'),
              const SizedBox(height: 10),
              _buildTextFiled(costConntroller, 'Koszt'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('wydatki_samochod')
                      .doc(document.id)
                      .update({
                    'data': dataConntroller.text,
                    'mileage': mileageConntroller.text,
                    'name': nameConntroller.text,
                    'cost': costConntroller.text,
                  }).whenComplete(() => Navigator.pop(context));
                },
                child: const Text('Aktualizuj'),
              ),
            ]
          ]));
        }));
  }
}
