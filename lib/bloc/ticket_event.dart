part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();
}

class GetTickets extends TicketEvent {
  final String userID;
  GetTickets(this.userID);
  @override
  List<Object> get props => [userID];
}

class BuyTickets extends TicketEvent {
  final String userID;
  final Ticket ticket;

  BuyTickets(this.userID, this.ticket);
  @override
  List<Object> get props => [userID, ticket];
}
