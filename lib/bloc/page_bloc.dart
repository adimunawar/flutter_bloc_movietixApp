import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mytix2/bloc/bloc.dart';
// import 'package:mytix/bloc/bloc.dart';
// import 'package:flutix3/bloc/bloc.dart';
import 'package:mytix2/model/model.dart';
// import 'package:flutter/cupertino.dart';
part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoesToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoesToMainPage) {
      yield OnMainPage();
    } else if (event is GoesToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoesToRegistrationPage) {
      yield OnRegistrationPage(event.registrationData);
    } else if (event is GoesToPreferencePage) {
      yield OnPreferencePage(event.registrationData);
    } else if (event is GoesToAccountConfirmationPage) {
      yield OnAccountConfirmationPage(event.registrationData);
    } else if (event is GoesToMovieDetailPage) {
      yield OnMovieDetailPage(event.movie);
    } else if (event is GoesToSelectSchedulePage) {
      yield OnSelectSchedulePage(event.detailMovie);
    } else if (event is GoesToSelectSeatPage) {
      yield OnSelectSeatPage(event.ticket);
    } else if (event is GoesToCheckOutPage) {
      yield OnCheckOutPage(event.ticket);
    } else if (event is GoesToSuccessPage) {
      yield OnSuccessPage(event.ticket, event.transaction);
    } else if (event is GoesToTicketDetailPage) {
      yield OnTicketDetailPage(event.ticket);
    } else if (event is GoesToProfilePage) {
      yield OnProfilePage();
    } else if (event is GoesToTopUpPage) {
      yield OnTopUpPage(event.pageEvent);
    } else if (event is GoesToWalletPage) {
      yield OnWalletPage(event.pageEvent);
    }
  }
}
