import 'package:proyecto_restaurante/instant_food/restaurante_app_theme.dart';
import 'package:proyecto_restaurante/instant_food/models/lista_platos3.dart';
import 'package:proyecto_restaurante/main.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ListaPlatosSegundoView extends StatefulWidget {
  const ListaPlatosSegundoView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _ListaPlatosSegundoViewState createState() => _ListaPlatosSegundoViewState();
}

class _ListaPlatosSegundoViewState extends State<ListaPlatosSegundoView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<ListaPlatosSegundoData> listaPlatosSegundoData =
      ListaPlatosSegundoData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                10.0, 100 * (3.0 - widget.mainScreenAnimation!.value), 2.0),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
              height: 416,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, right: 36, left: 36),
                itemCount: listaPlatosSegundoData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = listaPlatosSegundoData.length > 0
                      ? 50
                      : listaPlatosSegundoData.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 9.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return PlatosSegundoView(
                    listaPlatosSegundoData: listaPlatosSegundoData[index],
                    animation: animation,
                    animationController: animationController!,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class PlatosSegundoView extends StatelessWidget {
  const PlatosSegundoView(
      {Key? key,
      this.listaPlatosSegundoData,
      this.animationController,
      this.animation})
      : super(key: key);

  final ListaPlatosSegundoData? listaPlatosSegundoData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (0.8 - animation!.value), 12.0, 7.0),
            child: SizedBox(
              width: 350,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 48, left: 35, right: 100, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor(listaPlatosSegundoData!.endColor)
                                  .withOpacity(0.16),
                              offset: const Offset(1.1, 14.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor(listaPlatosSegundoData!.startColor),
                            HexColor(listaPlatosSegundoData!.endColor),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(44.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 0,
                    right: 70,
                    child: SizedBox(
                      width: 300,
                      height: 262,
                      child: Image.asset(listaPlatosSegundoData!.imagePath),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
