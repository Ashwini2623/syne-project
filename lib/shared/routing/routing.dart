import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/shared/routing/routing_path_constants.dart';
import 'package:project/views/add_transaction_page/add_transaction_page.dart';
import 'package:project/views/home_page/home_page.dart';

part 'routing.g.dart';

@TypedGoRoute<AddTxnPageRoute>(path: kAddNewTxnRoute)
class AddTxnPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddTransactionPage();
  }
}

@TypedGoRoute<HomePageRoute>(path: kHomeRoute)
class HomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage();
  }
}
