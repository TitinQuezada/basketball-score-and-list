import 'package:basketball_score_and_list/src/screens/players_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:basketball_score_and_list/src/screens/home_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'home': (context) => HomePage(),
  'players': (context) => PlayersPage()
};
