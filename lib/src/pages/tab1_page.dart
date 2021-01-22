import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mfa/src/services/news_srevice.dart';
import 'package:mfa/src/widgets/drawer.dart';
import 'package:mfa/src/widgets/lista_categorias.dart';
import 'package:mfa/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    return Scaffold(
      appBar: AppBar(
        title: Consumer<NewsService>(
          builder: (_, provider, widget) {
            return Text(provider.country);
          },
        ),
        centerTitle: true,
      ),
      body: (headlines.length == 0)
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                ListaCategorias(),
                Expanded(
                  child: RefreshIndicator(
                    child:
                        Consumer<NewsService>(builder: (context, news, child) {
                      return ListaNoticias(news.headlines);
                    }),
                    /*ListaNoticias(headlines),*/
                    onRefresh: _getRefreshData,
                  ),
                ),
              ],
            ),
      drawer: DrawerCountry(),
    );
  }

  Future<void> _getRefreshData() async {
    final country = Provider.of<NewsService>(context);
    country.getOnRefresh();
  }

  @override
  bool get wantKeepAlive => true;
}
