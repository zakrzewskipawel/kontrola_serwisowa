part of 'wydatki_page_content_cubit.dart';

@immutable
class WydatkiPageContentState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documentes;
  final bool isloading;
  final String errorMessage;

  const WydatkiPageContentState({
    required this.documentes,
    required this.isloading,
    required this.errorMessage,
  });
}
