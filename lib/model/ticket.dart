part of 'model.dart';

class Ticket extends Equatable {
  final DetailMovie detailMovie;
  final Theater theater;
  final DateTime dateTime;
  final String bookingCode;
  final List<String> seats;
  final String name;
  final int totalPrice;

  Ticket(this.detailMovie, this.bookingCode, this.dateTime, this.name,
      this.seats, this.theater, this.totalPrice);

  Ticket copyWith({
    DetailMovie detailMovie,
    Theater theater,
    DateTime dateTime,
    String bookingCode,
    List<String> seats,
    String name,
    int totalPrice,
  }) =>
      Ticket(
          detailMovie ?? this.detailMovie,
          bookingCode ?? this.bookingCode,
          dateTime ?? this.dateTime,
          name ?? this.name,
          seats ?? this.seats,
          theater ?? this.theater,
          totalPrice ?? this.totalPrice);

  String get seatsInString {
    String s = '';
    for (var seat in seats) {
      s += seat + ((seat != seats.last) ? ',' : '');
    }
    return s;
  }

  @override
  List<Object> get props =>
      [detailMovie, theater, name, bookingCode, seats, totalPrice, dateTime];
}
