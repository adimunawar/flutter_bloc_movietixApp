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
        body: Center(
          child: Text("Profile Page"),
        ),
      ),
    );
  }
}
