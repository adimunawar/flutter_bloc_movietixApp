part of 'model.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);
  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("XXI SGC"),
  Theater("Cinemaxx Mall Lippo "),
  Theater("CGV Living Plaza"),
  Theater("XXI Chartond"),
];
