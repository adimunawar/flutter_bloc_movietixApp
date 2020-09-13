part of 'pages.dart';

class Profilepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoesToMainPage());
        return;
      },
      child: Scaffold(
        body: Container(
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
                          context.bloc<PageBloc>().add(GoesToSplashPage());
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    // Center(
                    //   child: Text("Creat New\n Account",
                    //       style: blackTextFont.copyWith(fontSize: 20)),
                    // )
                  ],
                ),
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) {
                  if (userState is UserLoaded) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 6),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: (userState.user.profilePicture == ""
                                  ? AssetImage("assets/user_pic.png")
                                  : NetworkImage(
                                      userState.user.profilePicture)),
                            ),
                          ),
                        ),
                        Text(
                          userState.user.name,
                          style: blackTextFont.copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          userState.user.email,
                          style: greyTextFont.copyWith(fontSize: 18),
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
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset("assets/edit_profile.png")),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Edit Profile",
                      style: blackTextFont.copyWith(fontSize: 18),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 16),
                child: generateDashedDivider(
                    MediaQuery.of(context).size.width - 2 * defaultmargin),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 6, top: 6),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.help,
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoesToWalletPage(GoesToProfilePage()));
                      },
                      child: Text(
                        "My Wallet",
                        style: blackTextFont.copyWith(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFADADAD),
              ),
              Container(
                margin: EdgeInsets.only(top: 6, bottom: 6),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.save,
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Change Language",
                        style: blackTextFont.copyWith(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFADADAD),
              ),
              Container(
                margin: EdgeInsets.only(top: 6, bottom: 6),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset("assets/edit_profile.png")),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Help Centre",
                        style: blackTextFont.copyWith(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFADADAD),
              ),
              Container(
                margin: EdgeInsets.only(top: 6, bottom: 6),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app, color: mainColor),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Rate MyTix App",
                        style: blackTextFont.copyWith(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFADADAD),
              ),
              Container(
                margin: EdgeInsets.only(top: 6, bottom: 6),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app, color: mainColor),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Keluar",
                        style: blackTextFont.copyWith(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFADADAD),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
