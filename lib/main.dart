import 'package:basketball_score_and_list/routes.dart';
import 'package:basketball_score_and_list/src/providers/players_provider.dart';
import 'package:basketball_score_and_list/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlayersProvider()),
      ],
      child: MaterialApp(
        theme: theme,
        initialRoute: 'players',
        routes: routes,
      ),
    );
  }
}
