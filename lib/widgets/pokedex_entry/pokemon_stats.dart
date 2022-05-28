import 'package:flutter/material.dart';

import '../../controllers/pokedex_controller.dart';

class PokedexStats extends StatelessWidget {
  const PokedexStats({Key? key, required PokedexController pokedexController})
      : _pokedexController = pokedexController,
        super(key: key);
  final PokedexController _pokedexController;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.black12),
        columns: [
          DataColumn(
              label: Text('Stat',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          DataColumn(
              label: Text('Value',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('HP')),
            DataCell(Text(_pokedexController.getHp.toString())),
          ]),
          DataRow(cells: [
            DataCell(Text('Attack')),
            DataCell(Text(_pokedexController.getAttack.toString())),
          ]),
          DataRow(cells: [
            DataCell(Text('Defense')),
            DataCell(Text(_pokedexController.getDefense.toString())),
          ]),
          DataRow(cells: [
            DataCell(Text('Special Attack')),
            DataCell(Text(_pokedexController.getSpecialAttack.toString())),
          ]),
          DataRow(cells: [
            DataCell(Text('Special Defense')),
            DataCell(Text(_pokedexController.getSpecialDefense.toString())),
          ]),
          DataRow(cells: [
            DataCell(Text('Speed')),
            DataCell(Text(_pokedexController.getSpeed.toString())),
          ]),
        ]);
    ;
  }
}
