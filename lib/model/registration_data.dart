part of 'model.dart';

class RegistrationData {
  String name;
  String email;
  String password;
  List<String> selectedGenres;
  String selectedLang;
  File profileImage;

  RegistrationData(
{
  this.name = "",
  this.email = "",
  this.password = "",
  this.selectedGenres = const [],
  this.profileImage,
  this.selectedLang = "",
}
  );
}