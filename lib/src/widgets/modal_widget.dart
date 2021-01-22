import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:web_browser/web_browser.dart';

newsModal(context, url) {
  showMaterialModalBottomSheet(
    expand: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        child: SafeArea(
          child: WebBrowser(
            initialUrl: url,
            javascriptEnabled: true,
          ),
        ),
      );
    },
  );
}
