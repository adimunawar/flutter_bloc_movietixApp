part of 'model.dart';

class Promo extends Equatable{


  final String title;
  final String subtitle;
  final int discount;

  Promo({@required this.title,@required this.discount,@required this.subtitle});
  @override
  
  List<Object> get props => [title,subtitle, discount];


}
  List<Promo> dummypromos = [
    Promo (title: "Student Holiday", subtitle: "Maximal only for two people", discount: 50),
    Promo (title: "family club", subtitle: "Maximal only for theree member", discount: 70),
    Promo (title: "Subcription Promo", subtitle: "Min one year", discount: 40),
  ];