part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultmargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 135,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png")),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 16),
                child: Text(
                  "New experience",
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
              ),
              Text(
                "Wacth a new movie much\n easier then any before",
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w200),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 46,
                margin: EdgeInsets.only(top: 70, bottom: 19),
                child: RaisedButton(
                  child: Text(
                    "Get Started",
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                  color: mainColor,
                  onPressed: () {
                    context
                        .bloc<PageBloc>()
                        .add(GoesToRegistrationPage(RegistrationData()));
                  },
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account? ",
                        style:
                            greyTextFont.copyWith(fontWeight: FontWeight.w400)),
                    GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoesToLoginPage());
                      },
                      child: Text(
                        "Sign In",
                        style: purpleTextFont,
                      ),
                    )
                  ])
            ],
          )),
    );
  }
}
