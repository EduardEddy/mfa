import 'package:flutter/material.dart';
import 'package:mfa/src/services/news_srevice.dart';
import 'package:provider/provider.dart';

class DrawerCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addCountry = Provider.of<NewsService>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Sur America'),
          ),
          Divider(),
          _itemMenu(
              context, 'Argentina', 'argentina', 'ar', addCountry.country),
          Divider(),
          _itemMenu(context, 'Colombia', 'colombia', 'co', addCountry.country),
          Divider(),
          _itemMenu(
              context, 'Venezuela', 'venezuela', 've', addCountry.country),
          Divider(),
          ListTile(
            title: Text('Centro America'),
          ),
          Divider(),
          _itemMenu(context, 'Mexico', 'mexico', 'mx', addCountry.country),
          Divider(),
          ListTile(
            title: Text('Norte America'),
          ),
          Divider(),
          _itemMenu(context, 'Canada', 'canada', 'ca', addCountry.country),
          Divider(),
          _itemMenu(
              context, 'United States', 'bandera', 'us', addCountry.country),
          Divider(),
          ListTile(
            title: Text('Europa'),
          ),
          Divider(),
          _itemMenu(context, 'Germany', 'alemania', 'de', addCountry.country),
          Divider(),
          _itemMenu(context, 'Italia', 'italia', 'it', addCountry.country),
          Divider(),
          _itemMenu(context, 'United Kingdom', 'reino-unido', 'gb',
              addCountry.country),
        ],
      ),
    );
  }

  Widget _itemMenu(context, country, img, l_country, providerCountry) {
    final addCountry = Provider.of<NewsService>(context);

    return Container(
      decoration: (providerCountry == country)
          ? BoxDecoration(color: Colors.white)
          : BoxDecoration(),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/img/$img.png'),
        ),
        title: (providerCountry == country)
            ? Text(country,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
            : Text(country),
        onTap: () {
          addCountry.changeCountry(country, l_country);
          Navigator.pop(context);
        },
      ),
    );
  }
}
