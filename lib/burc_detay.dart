import 'package:flutter/material.dart';
import 'package:flutter_burcrehberi/burc_liste.dart';
import 'package:palette_generator/palette_generator.dart';


import 'models/burc.dart';
class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  BurcDetayState createState(){
    return new BurcDetayState();
  }
}

class BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenBurc=BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul(){
    Future<PaletteGenerator>fPaletGenaretor= PaletteGenerator.fromImageProvider(AssetImage("images/"+secilenBurc.burcBuyukResim));
    fPaletGenaretor.then((value){
      paletteGenerator=value;
      //debugPrint("seçilen renk :"+paletteGenerator.dominantColor.color.toString());
      setState(() {
        baskinRenk=paletteGenerator.dominantColor.color;

      });
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      primary: true,
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: baskinRenk!=null ? baskinRenk : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/"+secilenBurc.burcBuyukResim,fit: BoxFit.cover,),
              centerTitle: true,
            ),
            title: Text(secilenBurc.burcAdi+" Burcu ve Özellikleri"),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),

              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),

              child: SingleChildScrollView(
                child:  Text(secilenBurc.burcDetay,style: TextStyle(fontSize: 18,color: Colors.black87),
                ),
            ),
            ),
          )

        ],
      ),

    );
  }
}
