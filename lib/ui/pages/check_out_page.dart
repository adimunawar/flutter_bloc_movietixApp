part of 'pages.dart';

class CheckOutPage extends StatefulWidget {
  final Ticket ticket;

  CheckOutPage(this.ticket);
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 26000 * widget.ticket.seats.length;
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoesToSelectSeatPage(widget.ticket));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(color: accentColor1),
            SafeArea(
              child: Container(
                color: Colors.white,
              ),
            ),
            ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    //ICON BACK
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultmargin),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(
                                  GoesToSelectSchedulePage(
                                      widget.ticket.detailMovie));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) {
                        User user = (userState as UserLoaded).user;

                        return Column(
                          children: <Widget>[
                            // page Titel
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Check Out\nMovie",
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            //movie Description
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 70,
                                  height: 90,
                                  margin: EdgeInsets.only(
                                      left: defaultmargin, right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(imageBaseURL +
                                              'w342' +
                                              widget.ticket.detailMovie
                                                  .posterPath),
                                          fit: BoxFit.cover)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultmargin -
                                                70 -
                                                20,
                                        child: Text(
                                            widget.ticket.detailMovie.title,
                                            style: blackTextFont.copyWith(
                                                fontSize: 18),
                                            maxLines: 2,
                                            overflow: TextOverflow.clip)),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultmargin -
                                          70 -
                                          20,
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                          widget.ticket.detailMovie
                                              .genresAndLanguage,
                                          style: greyTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                    RatingStars(
                                      voteAverage: widget
                                          .ticket.detailMovie.voteAverenge,
                                      color: accentColor3,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: defaultmargin, vertical: 20),
                              child: Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Order ID",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(widget.ticket.bookingCode,
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            SizedBox(height: 9),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Cinema",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(widget.ticket.theater.name,
                                        textAlign: TextAlign.end,
                                        style: whiteTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  )
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Date & Time",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(widget.ticket.dateTime.dateAndTime,
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Seat Number",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(widget.ticket.seatsInString,
                                        textAlign: TextAlign.end,
                                        style: whiteNumberFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Price",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      "IDR 2500 X ${widget.ticket.seats.length}",
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Fee",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      "IDR 1.500 X ${widget.ticket.seats.length}",
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Total",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: 'IDR ',
                                      ).format(total),
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: defaultmargin, vertical: 20),
                              child: Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultmargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Your Wallet",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: 'IDR ',
                                      ).format(user.balance),
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: user.balance >= total
                                              ? Color(0xFF3E9D9D)
                                              : Color(0xFFFF5C83)))
                                ],
                              ),
                            ),
                            Container(
                              width: 250,
                              height: 46,
                              margin: EdgeInsets.only(top: 36, bottom: 50),
                              child: RaisedButton(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  color: user.balance >= total
                                      ? Color(0xFF3E9D9D)
                                      : mainColor,
                                  child: Text(
                                      user.balance >= total
                                          ? "Checkout Now"
                                          : "Top Up My Wallet",
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16)),
                                  onPressed: () {
                                    if (user.balance >= total) {
                                      //uang cukup
                                      FlutixTransaction transaction =
                                          FlutixTransaction(
                                              userID: user.id,
                                              title: widget
                                                  .ticket.detailMovie.title,
                                              subtitle:
                                                  widget.ticket.theater.name,
                                              time: DateTime.now(),
                                              amount: -total,
                                              picture: widget.ticket.detailMovie
                                                  .posterPath);
                                      context.bloc<PageBloc>().add(
                                          GoesToSuccessPage(
                                              widget.ticket
                                                  .copyWith(totalPrice: total),
                                              transaction));
                                    } else {
                                      //uang tidak cukup
                                    }
                                  }),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
