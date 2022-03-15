/*import 'dart:ui';

import 'package:proyecto_restaurante/instant_food/ui_view/title_view.dart';
import 'package:proyecto_restaurante/instant_food/restaurante_app_theme.dart';
import 'package:proyecto_restaurante/instant_food/restaurante/platos.dart';
import 'package:proyecto_restaurante/instant_food/restaurante/platos2.dart';
import 'package:proyecto_restaurante/instant_food/restaurante/platos3.dart';*/

import 'package:flutter/material.dart';

/*class Comida extends StatefulWidget {
  const Comida({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _ComidaState createState() => _ComidaState();
}

class _ComidaState extends State<Comida> with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 9;

    listViews.add(
      ListaPlatosView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );
    listViews.add(
      ListaPlatosSegundoView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );
    listViews.add(
      ListaPlatosTerceroView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        /*body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),*/
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Start Food',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 40 + 6 - 6 * topBarOpacity,
                                      letterSpacing: 1.2,
                                      color: FitnessAppTheme.darkerText,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Image(
                              image: NetworkImage(
                                  'https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/ce/be/69/cebe6910-fa04-fd40-2202-172eac679f75/source/256x256bb.jpg'),
                              height: 90,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Restaurante de comida Rapida',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 32 + 6 - 6 * topBarOpacity,
                                      letterSpacing: 5.2,
                                      color: FitnessAppTheme.darkerText,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Número de clicks',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 5.2,
                            color: FitnessAppTheme.darkerText,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}*/
class Comida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: IconButton(
          icon: new Icon(Icons.restaurant, color: Colors.blue[50]),
          onPressed: () => print('hi on icon action'),
        ),
        title: Text(
          'Restaurantes',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 40 + 9 - 6,
              letterSpacing: 1.9,
              fontStyle: FontStyle.italic),
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.star_border_purple500,
                color: Colors.lightGreenAccent[50]),
            onPressed: () => print('hi on icon action'),
          ),
          IconButton(
            icon: new Icon(Icons.star_border_purple500,
                color: Colors.lightGreenAccent[50]),
            onPressed: () => print('hi on icon action'),
          ),
          IconButton(
            icon: new Icon(Icons.star_border_purple500,
                color: Colors.lightGreenAccent[50]),
            onPressed: () => print('hi on icon action'),
          ),
          IconButton(
            icon: new Icon(Icons.star_border_purple500,
                color: Colors.lightGreenAccent[50]),
            onPressed: () => print('hi on icon action'),
          ),
          IconButton(
            icon: new Icon(Icons.star_border_purple500,
                color: Colors.lightGreenAccent[50]),
            onPressed: () => print('hi on icon action'),
          ),
          IconButton(
            icon: new Icon(Icons.star_border_purple500,
                color: Colors.lightGreenAccent[50]),
            onPressed: () => print('hi on icon action'),
          ),
          IconButton(
            icon: new Icon(Icons.star_border_purple500,
                color: Colors.lightGreenAccent[50]),
            onPressed: () => print('hi on icon action'),
          ),
          IconButton(
            icon: new Icon(Icons.star_border_purple500,
                color: Colors.lightGreenAccent[50]),
            onPressed: () => print('hi on icon action'),
          ),
        ],
      ),
      body: Center(
        /*child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 16, right: 16, top: 16 - 8.0, bottom: 12 - 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Start Food',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40 + 6 - 6,
                            letterSpacing: 1.2,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Start Food',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40 + 6 - 6,
                          letterSpacing: 1.2,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
            Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKS-dKNkKRIaWhAboKXg8m7xEnmsgKncc1sQ&usqp=CAU'),
            RaisedButton(
              child: Text('Open route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],
        ),*/
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 46, right: 46, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/area1.png',
                    height: 500,
                    width: 450,
                  ),
                  /*2*/
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_city,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selva Alegre Oe 3-74 y, Antonio de Ulloa, Quito 170520',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lock_clock_rounded,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abre de lunes a sábado, 10:00–18:30',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.phone,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '0987063402',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightGreenAccent)),
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.lightGreenAccent[100],
                      child: Text(
                        'ver comida',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            letterSpacing: 1.9,
                            fontStyle: FontStyle.italic),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondRoute()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/area3.png',
                    height: 500,
                    width: 450,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_city,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Amazonas y, Reventador, Quito 170134',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lock_clock_rounded,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abre de lunes a sábado, 11:30–22:45',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.phone,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '0985898202',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightGreenAccent)),
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.lightGreenAccent[100],
                      child: Text(
                        'ver comida',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            letterSpacing: 1.9,
                            fontStyle: FontStyle.italic),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThirdRoute()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/area2.png',
                    height: 500,
                    width: 450,
                  ),
                  /*2*/
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_city,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gil Ramirez N2206, Quito 170526',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lock_clock_rounded,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abre de lunes a sábado, 11:00–17:00',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.phone,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '0984507679',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightGreenAccent)),
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.lightGreenAccent[100],
                      child: Text(
                        'ver comida',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            letterSpacing: 1.9,
                            fontStyle: FontStyle.italic),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuartRoute()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("STAR FOOD"),
      ),
      body: Center(
        /*child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),*/
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 46, right: 46, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/plato1.png',
                    height: 500,
                    width: 450,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hamburguesas De Chorizo',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant_menu_sharp,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PORCIONES',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rinde 5 porciones, 1 hamburguesa por porción ',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.price_change,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '4 dólares',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.black,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.9,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/glass.png',
                    height: 500,
                    width: 450,
                  ),
                  /*2*/
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hamburguesa De Atún Con Aderezo De Chipotle Y Tamarindo',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant_menu_sharp,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PORCIONES',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rinde 4 porciones, 1 hamburguesa por porción',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.price_change,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '6 dólares',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.black,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.9,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/bell.png',
                    height: 500,
                    width: 450,
                  ),
                  /*2*/
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hamburguesa Rellena De Queso Envuelta En Tocino',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant_menu_sharp,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PORCIONES',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rinde 4 porciones, 1 hamburguesa por porción',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.price_change,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '7 dólares',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.black,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.9,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("FAST FOOD"),
      ),
      body: Center(
        /*child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),*/
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 46, right: 46, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/eaten.png',
                    height: 500,
                    width: 450,
                  ),
                  /*2*/
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Papi pollo',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant_menu_sharp,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PORCIONES',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rinde 3 porciones, 1 porción de papas, pollo y ensalada.',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.price_change,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3 dólares',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.black,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.9,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/back.png',
                    height: 500,
                    width: 450,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Salchipapas',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant_menu_sharp,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PORCIONES',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rinde 3 porciones, 1 porción de papas, salchicha y ensalada.',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.price_change,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3 dólares',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.black,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.9,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/bottle.png',
                    height: 500,
                    width: 450,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Papi carne',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant_menu_sharp,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PORCIONES',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rinde 3 porciones, 1 porción de papas, carne y ensalada.',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.price_change,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '5 dólares',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.black,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.9,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuartRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("LOREMIPSUM"),
      ),
      body: Center(
        /*child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),*/
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 46, right: 46, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/burned.png',
                    height: 500,
                    width: 450,
                  ),
                  /*2*/
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Perros calientes con tocineta, guacamole y maduro',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant_menu_sharp,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PORCIONES',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rinde 4 porciones, pan largo, salchicha, tocineta y aguacate',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.price_change,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '8 dólares',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.black,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.9,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/fitness_app.png',
                    height: 500,
                    width: 450,
                  ),
                  /*2*/
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Choripán',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant_menu_sharp,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PORCIONES',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rinde 3 porciones, pan largo, chorizo, ensalada',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.price_change,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '7 dólares',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.black,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.9,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.white,
                      splashColor: Colors.white,
                      color: Colors.white,
                      child: Text(
                        '',
                        textAlign: TextAlign.left,
                        style: TextStyle(

                          fontSize: 2,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 36, right: 36, top: 0, bottom: 0),

              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/fitness_app/runner.png',
                    height: 500,
                    width: 450,
                  ),
                  /*2*/
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Perro Italiano',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.restaurant_menu_sharp,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PORCIONES',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rinde 4 porciones, pan largo, salchicha, tomate y queso',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.price_change,
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '7 dólares',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 130, right: 0, top: 20, bottom: 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fiveRoute()),
                        );
                      },
                      disabledColor: Colors.black,
                      splashColor: Colors.amber,
                      color: Colors.black,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.9,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class fiveRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("Inicia Sesión"),
      ),
      body:
          /*child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),*/
          SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 300,
                left: 250,
                child: Container(
                  width: 300,
                  height: 230,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
              
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 300, right: 300, top: 10, bottom: 50),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      _logo(),
                      const SizedBox(
                        height: 30,
                      ),
                      _loginLabel(),
                      const SizedBox(
                        height: 30,
                      ),
                      _labelTextInput("Correo", "yourname@example.com", false),
                      const SizedBox(
                        height: 50,
                      ),
                      _labelTextInput("Contraseña", "yourpassword", true),
                      const SizedBox(
                        height: 30,
                      ),
                      _loginBtn(),
                      const SizedBox(
                        height: 30,
                      ),
                      _signUpLabel("No tienes cuenta?",
                          const Color(0xff909090)),
                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 100, right: 100, top: 20, bottom: 0),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SixRoute()),
                            );
                          },
                          disabledColor: Colors.black,
                          splashColor: Colors.amber,
                          color: Colors.black,
                          child: Text(
                            'Regístrate',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              letterSpacing: 1.9,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _signUpLabel(String label, Color textColor) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18,
        letterSpacing: 1.2,
        color: Colors.black,
        fontStyle: FontStyle.italic),
  );
}

Widget _loginBtn() {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: const BoxDecoration(
      color: Color(0xFF01579B),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextButton(
      onPressed: () => {},
      child: Text(
        "Iniciar Sesión",
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            letterSpacing: 1.2,
            color: Colors.white,
            fontStyle: FontStyle.italic),
      ),
    ),
  );
}

Widget _labelTextInput(String label, String hintText, bool isPassword) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            letterSpacing: 1.2,
            color: Colors.black,
            fontStyle: FontStyle.italic),
      ),
      TextField(
        obscureText: isPassword,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          hintText: hintText,
          /*hintStyle: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              color: Color(0xffc5d2e1),
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),*/
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffdfe8f3)),
          ),
        ),
      ),
    ],
  );
}

Widget _loginLabel() {
  return Center(
    child: Text(
      "Inicia Sesión",
      style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 40,
          letterSpacing: 1.2,
          color: Colors.black,
          fontStyle: FontStyle.italic),
    ),
  );
}

Widget _logo() {
  return Center(
    child: SizedBox(
      child: Image.asset("assets/fitness_app/tab_2.png"),
      height: 80,
    ),
  );
}

class SixRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("Regístrate"),
      ),
      body:
          /*child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),*/
          SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 400,
                left: 300,
                child: Container(
                  width: 1000,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8BBD0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 400,
                left: 300,
                child: Container(
                  width: 1000,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF212121),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 638,
                left: 300,
                child: Container(
                  width: 1000,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF212121),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 875,
                left: 300,
                child: Container(
                  width: 1000,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF212121),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 757,
                left: 300,
                child: Container(
                  width: 1000,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF212121),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 518,
                left: 300,
                child: Container(
                  width: 1000,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF212121),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: -10,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE1F5FE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 300, right: 300, top: 10, bottom: 50),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                        width: 50,
                      ),
                      _logoTwo(),
                      const SizedBox(
                        height: 70,
                      ),
                      _loginLabelTwo(),
                      const SizedBox(
                        height: 70,
                      ),
                      _labelTextInputTwo(
                          "correo", "yourname@example.com", false),
                      const SizedBox(
                        height: 50,
                      ),
                      _labelTextInputTwo("contraseña", "yourpassword", true),
                      const SizedBox(
                        height: 50,
                      ),
                      _labelTextInputTwo("nombre", "", false),
                      const SizedBox(
                        height: 50,
                      ),
                      _labelTextInputTwo("dirección", "", false),
                      const SizedBox(
                        height: 50,
                      ),
                      _labelTextInputTwo("celular", "", false),
                      const SizedBox(
                        height: 80,
                      ),
                      _loginBtnTwo(),
                      const SizedBox(
                        height: 90,
                      ),
                      _signUpLabelTwo(
                          "Tienes cuenta?", const Color(0xff909090)),
                      const SizedBox(
                        height: 10,
                      ),
                      _signUpLabelTwo("", const Color(0xff164276)),
                      const SizedBox(
                        height: 0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 100, right: 100, top: 20, bottom: 0),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => fiveRoute()),
                            );
                          },
                          disabledColor: Colors.black,
                          splashColor: Colors.amber,
                          color: Colors.black,
                          child: Text(
                            'Inicia Sesión',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              letterSpacing: 1.9,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _signUpLabelTwo(String label, Color textColor) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18,
        letterSpacing: 1.2,
        color: Colors.black26,
        fontStyle: FontStyle.italic),
  );
}

Widget _loginBtnTwo() {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: const BoxDecoration(
      color: Color(0xFF01579B),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextButton(
      onPressed: () => {},
      child: Text(
        "Regístrarse",
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40 + 6 - 6,
            letterSpacing: 1.2,
            color: Colors.white,
            fontStyle: FontStyle.italic),
      ),
    ),
  );
}

Widget _labelTextInputTwo(String label, String hintText, bool isPassword) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            letterSpacing: 1.2,
            color: Colors.black26,
            fontStyle: FontStyle.italic),
      ),
      TextField(
        obscureText: isPassword,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          hintText: hintText,
          /*hintStyle: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              color: Color(0xffc5d2e1),
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),*/
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffdfe8f3)),
          ),
        ),
      ),
    ],
  );
}

Widget _loginLabelTwo() {
  return Center(
    child: Text(
      "Regístrate",
      style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 40,
          letterSpacing: 1.2,
          color: Colors.black,
          fontStyle: FontStyle.italic),
    ),
  );
}

Widget _logoTwo() {
  return Center(
    child: SizedBox(
      child: Image.asset("assets/fitness_app/tab_2.png"),
      height: 80,
    ),
  );
}
