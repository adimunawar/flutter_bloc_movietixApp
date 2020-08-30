part of 'pages.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isExpired = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //content
          Container(),

          //header
          Container(
            height: 113,
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            height: 113,
            color: accentColor1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 24, bottom: 32),
                    child: Text(
                      "My Ticket",
                      style: whiteTextFont.copyWith(fontSize: 20),
                    )),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpired = !isExpired;
                            });
                          },
                          child: Text("Newest",
                              style: whiteTextFont.copyWith(
                                  fontSize: 16,
                                  color: !isExpired
                                      ? Colors.white
                                      : Color(0xFF6F678E))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 4,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: !isExpired ? accentColor2 : Colors.transparent,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpired = !isExpired;
                            });
                          },
                          child: Text("Oldest",
                              style: whiteTextFont.copyWith(
                                  fontSize: 16,
                                  color: isExpired
                                      ? Colors.white
                                      : Color(0xFF6F678E))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 4,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: isExpired ? accentColor2 : Colors.transparent,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
