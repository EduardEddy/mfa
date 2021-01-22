import 'package:flutter/material.dart';
import 'package:mfa/src/pages/tab1_page.dart';

import 'package:mfa/src/services/news_srevice.dart';
import 'package:mfa/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsService())],
      child: MaterialApp(
          title: 'My First App',
          theme: miTema,
          debugShowCheckedModeBanner: false,
          home: Tab1Page()),
    );
  }
}
