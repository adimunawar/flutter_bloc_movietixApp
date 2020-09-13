part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoesToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoesToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoesToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoesToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;
  GoesToRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoesToPreferencePage extends PageEvent {
  final RegistrationData registrationData;
  GoesToPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoesToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;
  GoesToAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoesToMovieDetailPage extends PageEvent {
  final Movie movie;

  GoesToMovieDetailPage(this.movie);
  @override
  List<Object> get props => [movie];
}

class GoesToSelectSchedulePage extends PageEvent {
  final DetailMovie detailMovie;
  GoesToSelectSchedulePage(this.detailMovie);
  @override
  List<Object> get props => [detailMovie];
}

class GoesToSelectSeatPage extends PageEvent {
  final Ticket ticket;
  GoesToSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoesToCheckOutPage extends PageEvent {
  final Ticket ticket;
  GoesToCheckOutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoesToSuccessPage extends PageEvent {
  final Ticket ticket;
  final FlutixTransaction transaction;
  GoesToSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}

class GoesToTicketDetailPage extends PageEvent {
  final Ticket ticket;
  GoesToTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoesToProfilePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoesToTopUpPage extends PageEvent {
  final PageEvent pageEvent;

  GoesToTopUpPage(this.pageEvent);
  @override
  List<Object> get props => [pageEvent];
}

class GoesToWalletPage extends PageEvent {
  final PageEvent pageEvent;

  GoesToWalletPage(this.pageEvent);
  @override
  List<Object> get props => [pageEvent];
}
