import 'package:basketball_score_and_list/src/components/application_app_bar.dart';
import 'package:basketball_score_and_list/src/components/application_icon.dart';
import 'package:basketball_score_and_list/src/models/player.dart';
import 'package:basketball_score_and_list/src/providers/players_provider.dart';
import 'package:basketball_score_and_list/src/widgets/player_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar('Listado'),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addPlayer(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<PlayersProvider>(
        builder: (context, playersProvider, widget) =>
            _buildListView(context, playersProvider));
  }

  ListView _buildListView(
      BuildContext context, PlayersProvider playersProvider) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: _buildTiles(context, playersProvider.getPlayers()),
      ).toList(),
    );
  }

  List<Widget> _buildTiles(BuildContext context, List<Player> players) {
    List<ListTile> listTiles = [];

    for (var player in players) {
      listTiles.add(ListTile(
        title: Text(player.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: _getPlayerActionButtons(context, player),
        ),
      ));
    }

    return listTiles;
  }

  List<Widget> _getPlayerActionButtons(BuildContext context, Player player) {
    return [
      ApplicationIcon(
        Icons.edit,
        color: Colors.amber,
        onTap: () => print('editando ${player.id}'),
      ),
      SizedBox(
        width: 10,
      ),
      ApplicationIcon(Icons.delete,
          color: Colors.red, onTap: () => _showDeleteDialog(context, player)),
    ];
  }

  void _addPlayer(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => SimpleDialog(
              title: Text('Agregar jugador'),
              children: [PlayerForm()],
            ));
  }

  void _showDeleteDialog(BuildContext context, Player player) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Esta seguro que desea eliminar a ${player.name}?'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () => _deletePlayer(context, player),
                        child: Text('Si')),
                    SizedBox(width: 15.0),
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('No', style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }

  void _deletePlayer(BuildContext context, Player player) {
    PlayersProvider playerProvider =
        Provider.of<PlayersProvider>(context, listen: false);

    playerProvider.removePlayer(player);

    Navigator.pop(context);
  }
}
