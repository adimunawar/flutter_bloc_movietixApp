part of 'pages.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // note: header
        Container(
          decoration: BoxDecoration(
              color: accentColor1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          padding: EdgeInsets.fromLTRB(defaultmargin, 20, defaultmargin, 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload).then((downloadURL) {
                    imageFileToUpload = null;
                    context
                        .bloc<UserBloc>()
                        .add(UpdateData(profileImage: downloadURL));
                  });
                }
                return Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoesToProfilePage());
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0xFF5F5588), width: 1)),
                        child: Stack(
                          children: <Widget>[
                            SpinKitFadingCircle(color: accentColor2, size: 50),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (userState.user.profilePicture ==
                                              ""
                                          ? AssetImage("assets/user_pic.png")
                                          : NetworkImage(
                                              userState.user.profilePicture)),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                2 * defaultmargin -
                                78,
                            child: Text(
                              userState.user.name,
                              style: whiteTextFont.copyWith(fontSize: 18),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            )),
                        Text(
                          NumberFormat.currency(
                                  locale: "id_ID",
                                  decimalDigits: 0,
                                  symbol: "IDR ")
                              .format(userState.user.balance),
                          style: yellowNumberFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentColor2,
                  size: 50,
                );
              }
            },
          ),
        ),
        //note: NOW Playing
        Container(
          padding: EdgeInsets.fromLTRB(defaultmargin, 30, defaultmargin, 12),
          child: Text(
            "Now Playing",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (_, movieState) {
              if (movieState is MovieLoaded) {
                List<Movie> movies = movieState.movies.sublist(0, 10);
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.only(
                              left: (index == 0) ? defaultmargin : 0,
                              right: (index == movies.length - 1)
                                  ? defaultmargin
                                  : 16),
                          child: MovieCard(
                            movies[index],
                            onTap: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoesToMovieDetailPage(movies[index]));
                            },
                          ),
                        ));
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
        ),
        //Browse Movie
        Container(
          padding: EdgeInsets.fromLTRB(defaultmargin, 30, defaultmargin, 12),
          child: Text(
            "Browse Movie",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        BlocBuilder<UserBloc, UserState>(
          builder: (_, userState) {
            if (userState is UserLoaded) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultmargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      userState.user.selectedGenres.length,
                      (index) =>
                          BrowseButton(userState.user.selectedGenres[index])),
                ),
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          },
        ),

        //Coming Soon
        Container(
          padding: EdgeInsets.fromLTRB(defaultmargin, 30, defaultmargin, 12),
          child: Text(
            "Coming Soon",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (_, movieState) {
              if (movieState is MovieLoaded) {
                List<Movie> movies = movieState.movies.sublist(10);
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.only(
                              left: (index == 0) ? defaultmargin : 0,
                              right: (index == movies.length - 1)
                                  ? defaultmargin
                                  : 16),
                          child: ComingSoonCard(movies[index]),
                        ));
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
        ),
        //note: GetLuckyDay
        Container(
          padding: EdgeInsets.fromLTRB(defaultmargin, 30, defaultmargin, 12),
          child: Text(
            "Get Lucky Day",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: dummypromos
              .map((e) => Padding(
                  padding:
                      EdgeInsets.fromLTRB(defaultmargin, 0, defaultmargin, 16),
                  child: PromoCard(e)))
              .toList(),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
