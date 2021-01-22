import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mfa/src/services/news_srevice.dart';
import 'package:provider/provider.dart';

class ListaCategorias extends StatefulWidget {
  @override
  _ListaCategoriasState createState() => _ListaCategoriasState();
}

class _ListaCategoriasState extends State<ListaCategorias>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 10.0),
        height: 90,
        child: ListView(
          // La línea a continuación hace el truco.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _list(context, FontAwesomeIcons.history, 'General', 'general'),
            _list(
                context, FontAwesomeIcons.simCard, 'Tecnologia', 'technology'),
            _list(context, FontAwesomeIcons.baseballBall, 'Deporte', 'sports'),
            _list(context, FontAwesomeIcons.microscope, 'Ciencia', 'science'),
            _listEnt(context, FontAwesomeIcons.film, 'Entretenimiento',
                'entertainment'),
            _list(context, FontAwesomeIcons.heartbeat, 'Salud', 'health'),
            _list(context, FontAwesomeIcons.chartLine, 'Negocio', 'business'),
          ],
        ));
  }

  Widget _list(
      BuildContext context, IconData icon, String title, String categoria) {
    final addCategory = Provider.of<NewsService>(context);
    if (addCategory.country == 'United States' ||
        addCategory.country == 'Canada' ||
        addCategory.country == 'Germany' ||
        addCategory.country == 'United Kingdom') {
      title = categoria;
    }
    return GestureDetector(
      child: Container(
        width: 110.0,
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 35,
              color: (addCategory.category == categoria)
                  ? Colors.blue
                  : Colors.white,
            ),
            SizedBox(height: 15.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 1.5,
                  color: (addCategory.category == categoria)
                      ? Colors.blue
                      : Colors.white),
            ),
          ],
        ),
      ),
      onTap: () {
        addCategory.changeCategory(categoria);
      },
    );
  }

  Widget _listEnt(
      BuildContext context, IconData icon, String title, String categoria) {
    final addCategory = Provider.of<NewsService>(context);
    if (addCategory.country == 'United States' ||
        addCategory.country == 'Canada' ||
        addCategory.country == 'Germany' ||
        addCategory.country == 'United Kingdom') {
      title = categoria;
    }
    return GestureDetector(
      child: Container(
        width: 125.0,
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 35,
              color: (addCategory.category == categoria)
                  ? Colors.blue
                  : Colors.white,
            ),
            SizedBox(height: 15.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 1.5,
                  color: (addCategory.category == categoria)
                      ? Colors.blue
                      : Colors.white),
            ),
          ],
        ),
      ),
      onTap: () {
        addCategory.changeCategory(categoria);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
