import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kontrola_serwisowa/app/features/home/Update_page_content/Update_page_content.dart';
import 'package:kontrola_serwisowa/app/features/home/wydatki_page_content/cubit/wydatki_page_content_cubit.dart';

class WydatkiPageContent extends StatelessWidget {
  const WydatkiPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WydatkiPageContentCubit()..start(),
        child: BlocBuilder<WydatkiPageContentCubit, WydatkiPageContentState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Text('Something went wrong ${state.errorMessage}'),
              );
            }
            if (state.isloading) {
              return const Center(child: CircularProgressIndicator());
            }
            // ignore: unused_local_variable
            final documentes = state.documentes;

            return ListView(
              children: [
                for (final document in state.documentes) ...[
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 209, 213),
                          offset: Offset(10.0, 10.0), //(x,y)
                          blurRadius: 50.0,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Data = ',
                                    style: GoogleFonts.poppins(fontSize: 15)),
                                Text(document['data'].toString(),
                                    style: GoogleFonts.poppins(fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Aktualny przebieg = ',
                                    style: GoogleFonts.poppins(fontSize: 15)),
                                Text(document['course'].toString(),
                                    style: GoogleFonts.poppins(fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Wydatek: ',
                                    style: GoogleFonts.poppins(fontSize: 15)),
                                Text(document['name'],
                                    style: GoogleFonts.poppins(fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Koszt = ',
                                    style: GoogleFonts.poppins(fontSize: 15)),
                                Text(document['cost'].toString(),
                                    style: GoogleFonts.poppins(fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('wydatki_samochod')
                                    .doc(document.id)
                                    .delete();
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                dataConntroller.text = document['data'];
                                nameConntroller.text = document['name'];
                                costConntroller.text = document['cost'];
                                courseConntroller.text = document['course'];
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const UpdatePageContent(),
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                                size: 25,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ],
            );
          },
        ));
  }
}
