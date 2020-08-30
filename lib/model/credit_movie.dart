part of 'model.dart';

class CreditMovie extends Equatable {
  final String name;
  final String profilePath;

  CreditMovie ({this.name, this.profilePath});

  @override
 
  List<Object> get props => [name, profilePath];
}