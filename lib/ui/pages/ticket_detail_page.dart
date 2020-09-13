part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  TicketDetailPage(this.ticket);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoesToMainPage());

          return;
        },
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              color: accentColor1,
            ),
            SafeArea(
                child: Container(
              color: Color(0xFFF0F7F9),
            )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoesToMainPage());
                            },
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text("Ticket Details",
                              style: blackTextFont.copyWith(fontSize: 20)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,

                    // decoration:
                    //     BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              image: DecorationImage(
                                  image: NetworkImage(imageBaseURL +
                                          "w1280" +
                                          ticket.detailMovie.backdropPath ??
                                      ticket.detailMovie.posterPath),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 16, left: 16, right: 16, bottom: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                ticket.detailMovie.title,
                                style: blackTextFont.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                ticket.detailMovie.genresAndLanguage,
                                style: greyTextFont.copyWith(fontSize: 12),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              // note: RATING
                              RatingStars(
                                voteAverage: ticket.detailMovie.voteAverenge,
                                color: accentColor3,
                                alignment: MainAxisAlignment.start,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Cinema",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(ticket.theater.name,
                                        style: whiteNumberFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Date & Time",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(ticket.dateTime.dateAndTime,
                                        style: whiteNumberFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Seat Number",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(ticket.seatsInString,
                                        style: whiteNumberFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ID Order",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(ticket.bookingCode,
                                        style: whiteNumberFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 18),
                                child: Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 1,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BlocBuilder<UserBloc, UserState>(
                                      builder: (_, userState) {
                                    if (userState is UserLoaded) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name",
                                            style: greyTextFont.copyWith(
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            userState.user.name,
                                            style: blackTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Paid",
                                            style: greyTextFont.copyWith(
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text("RP ${ticket.totalPrice}",
                                              style: whiteNumberFont.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black))
                                          // Text("data")
                                        ],
                                      );
                                    } else {
                                      return SpinKitFadingCircle(
                                        color: accentColor2,
                                        size: 50,
                                      );
                                    }
                                  }),
                                  Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage("assets/qr.png"),
                                              fit: BoxFit.cover)))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )));
  }
}
