import 'package:basketball_score_and_list/src/models/player.dart';
import 'package:basketball_score_and_list/src/providers/players_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerForm extends StatefulWidget {
  final Player? player;

  PlayerForm({this.player});

  @override
  _PlayerFormState createState() => _PlayerFormState();
}

class _PlayerFormState extends State<PlayerForm> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _builForm(context),
        SizedBox(
          height: 20.0,
        ),
        _buildActions(context),
      ],
    );
  }

  Widget _builForm(BuildContext context) {
    if (this.widget.player != null) {
      nameController.text = this.widget.player!.name;
    }

    return TextField(
      decoration: InputDecoration(labelText: 'Nombre del jugador'),
      controller: nameController,
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (this.widget.player == null)
          OutlinedButton(
              onPressed: () => _add(context), child: Text('Agregar')),
        if (this.widget.player != null)
          OutlinedButton(
              onPressed: () => _edit(context), child: Text('Editar')),
        SizedBox(
          width: 20,
        ),
        OutlinedButton(
          onPressed: () => _cancel(context),
          child: Text(
            'Cancelar',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.redAccent),
          ),
        )
      ],
    );
  }

  void _cancel(BuildContext context) {
    Navigator.pop(context);
  }

  void _add(BuildContext context) {
    PlayersProvider playerProvider =
        Provider.of<PlayersProvider>(context, listen: false);
    playerProvider.addPlayer(nameController.text);
    Navigator.pop(context);
  }

  void _edit(BuildContext context) {
    PlayersProvider playerProvider =
        Provider.of<PlayersProvider>(context, listen: false);

    Player playerResult = Player(widget.player!.id, nameController.text);
    playerProvider.editPlayer(playerResult);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }
}
