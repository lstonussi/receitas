import 'package:flutter/material.dart';
import 'package:receita/components/main_drawer.dart';
import 'package:receita/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChange;
  final Settings
      settings; //Variavel que vem do main com o estado das confgiurações
  SettingsScreen(this.onSettingsChange, this.settings);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings; //Variavel local para definir o estado dos switchs
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch('Sem Gluten', 'Só exibe refeições sem gluten',
                      settings.isGlutenFree, (value) {
                    setState(() {
                      settings.isGlutenFree = value;
                    });
                  }),
                  _createSwitch('Sem Lactose', 'Só exibe refeições sem lactose',
                      settings.isLactoseFree, (value) {
                    setState(() {
                      settings.isLactoseFree = value;
                    });
                  }),
                  _createSwitch(
                      'Vegano', 'Só exibe refeições veganas', settings.isVegan,
                      (value) {
                    setState(() {
                      settings.isVegan = value;
                    });
                  }),
                  _createSwitch(
                      'Vegetariano',
                      'Só exibe refeições vegetarianas',
                      settings.isVegetarian, (value) {
                    setState(
                      () {
                        settings.isVegetarian = value;
                      },
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
