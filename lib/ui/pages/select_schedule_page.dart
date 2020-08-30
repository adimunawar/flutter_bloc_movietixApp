part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final DetailMovie detailMovie;

  SelectSchedulePage(this.detailMovie);
  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectedTime;
  Theater selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoesToMovieDetailPage(widget.detailMovie));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: accentColor1,
            ),
            SafeArea(
              child: Container(
                color: Colors.white,
              ),
            ),
            ListView(
              children: <Widget>[
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: defaultmargin),
                    padding: EdgeInsets.all(1),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(5),
                    //     color: Colors.black.withOpacity(0.04)),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoesToMovieDetailPage(widget.detailMovie));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(defaultmargin, 20, defaultmargin, 16),
                  child: Text(
                    "Choose Date",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24),
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                          left: (index == 0) ? defaultmargin : 0,
                          right:
                              (index < dates.length - 1) ? 16 : defaultmargin),
                      child: DateCard(
                        dates[index],
                        isSelected: selectedDate == dates[index],
                        onTap: () {
                          setState(() {
                            selectedDate = dates[index];
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //Choose TIme

                genereteTimeTable(),
                //tombol next

                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topCenter,
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) => FloatingActionButton(
                        elevation: 0,
                        backgroundColor:
                            (isValid) ? mainColor : Color(0xFFBEBEBE),
                        child: Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (isValid) {
                            context.bloc<PageBloc>().add(GoesToSelectSeatPage(
                                Ticket(
                                    widget.detailMovie,
                                    randomAlphaNumeric(12).toUpperCase(),
                                    DateTime(
                                        selectedDate.year,
                                        selectedDate.month,
                                        selectedDate.day,
                                        selectedTime),
                                    (userState as UserLoaded).user.name,
                                    null,
                                    selectedTheater,
                                    null)));
                          }
                        }),
                  ),
                ),
                SizedBox(height: 30),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column genereteTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theater in dummyTheaters) {
      widgets.add(Container(
          margin: EdgeInsets.fromLTRB(defaultmargin, 0, defaultmargin, 16),
          child: Text(theater.name,
              style: blackTextFont.copyWith(
                fontSize: 20,
              ))));

      widgets.add(Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 50),
        child: ListView.builder(
            itemCount: schedule.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(
                      left: (index == 0) ? defaultmargin : 0,
                      right:
                          (index < schedule.length - 1) ? 16 : defaultmargin),
                  child: SelecTableBox(
                    "${schedule[index]}:00",
                    height: 50,
                    isSelected: selectedTheater == theater &&
                        selectedTime == schedule[index],
                    isEnabled: schedule[index] > DateTime.now().hour ||
                        selectedDate.day != DateTime.now().day,
                    onTap: () {
                      setState(() {
                        selectedTheater = theater;
                        selectedTime = schedule[index];
                        isValid = true;
                      });
                    },
                  ),
                )),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
