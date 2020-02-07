import 'package:flutter/material.dart';
import 'package:flutter_burcrehberi/burc_liste.dart';
import 'package:flutter_burcrehberi/utils/testlib.dart';

import 'burc_detay.dart';
void main()=>runApp(MyApps());

class MyApps extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Burc Rehberi",
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcListesi",
      routes: {
        "/":(context) =>BurcListesi(),
        "/burcListesi":(context) =>BurcListesi(),

      },
      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");
        if(pathElemanlari[1]=='burcDetay'){
          return MaterialPageRoute(builder: (context)=>BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }

}
