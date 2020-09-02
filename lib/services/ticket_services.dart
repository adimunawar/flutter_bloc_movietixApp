part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      Firestore.instance.collection('tickets');

  static Future<void> saveTicket(String id, Ticket ticket) async {
    await ticketCollection.document().setData({
      'movieID': ticket.detailMovie.id ?? "",
      'userID': id ?? "",
      'theaterName': ticket.theater.name ?? 0,
      'time': ticket.dateTime.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice
    });
  }

  static Future<List<Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.getDocuments();
    var documents = snapshot.documents
        .where((document) => document.data["userID"] == userId);

    List<Ticket> tickets = [];
    for (var document in documents) {
      DetailMovie detailMovie = await MovieServices.getDetailMovie(null,
          movieID: document.data['movieID']);

      tickets.add(Ticket(
          detailMovie,
          document.data['bookingCode'],
          DateTime.fromMicrosecondsSinceEpoch(document.data['time']),
          document.data['name'],
          document.data['seats'].toString().split(','),
          Theater(document.data['theaterName']),
          document.data['totalPrice']));
    }
    return tickets;
  }
}
