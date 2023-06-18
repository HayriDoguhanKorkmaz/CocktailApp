import 'package:coctailapp/constant.dart';
import 'package:coctailapp/ui_windows/result_window.dart';

import 'package:coctailapp/ui_windows/search_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //dikey sayfa kullanımı (portrait mode)

  TextDirection.ltr; //no directionality widget not found error çözümü
  WidgetsFlutterBinding
      .ensureInitialized(); //Binding has not yet been initialized. error çözümü
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(
          const MyCoctail())); //cihazın app'i dikey modda açmasını sağlıyor
}

class MyCoctail extends StatelessWidget {
  const MyCoctail({super.key});

  @override
  Widget build(BuildContext context) {
    //tema dark veya white mod olcak
    return MaterialApp(
      home: SearchWindow(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:
            kBackgroundColor, //scaffeldı dark tema renginde yapma
      ),
    );
  }
}
