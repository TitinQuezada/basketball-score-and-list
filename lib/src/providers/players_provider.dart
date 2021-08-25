import 'package:basketball_score_and_list/src/models/player.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PlayersProvider with ChangeNotifier {
  final List<Player> _players = [];

  final uuid = Uuid();

  List<Player> getPlayers() {
    return _players;
  }

  void addPlayer(String name) {
    _players.add(new Player(uuid.v1(), name));
    notifyListeners();
  }

  void editPlayer(Player player) {
    Player playerResult =
        _players.firstWhere((element) => element.id == player.id);

    playerResult.name = player.name;
    notifyListeners();
  }

  void removePlayer(Player player) {
    _players.remove(player);
    notifyListeners();
  }
}
