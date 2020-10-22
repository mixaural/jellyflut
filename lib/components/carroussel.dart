import 'package:flutter/material.dart';
import 'package:jellyflut/components/asyncImage.dart';
import 'package:jellyflut/components/itemPoster.dart';
import 'package:jellyflut/main.dart';
import 'package:jellyflut/models/item.dart';
import 'package:jellyflut/provider/carrousselModel.dart';
import 'package:jellyflut/shared/shared.dart';
import 'critics.dart';

class CarousselItem extends StatefulWidget {
  CarousselItem(this.items,
      {this.textColor = Colors.white, this.detailMode = false});

  final List<Item> items;
  final Color textColor;
  final bool detailMode;

  @override
  State<StatefulWidget> createState() => _CarousselItemState();
}

class _CarousselItemState extends State<CarousselItem> {
  int _index = 0;

  @override
  void dispose() {
    CarrousselModel().reset();
    super.dispose();
  }

  void setFirstPoster() {
    CarrousselModel().changeItem(widget.items[_index].id);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => setFirstPoster());
    return _buildCarousel(widget.items);
  }

  Widget _buildCarousel(List<Item> items) {
    var customViewportFraction = widget.detailMode ? 1.0 : 0.4;
    return PageView.builder(
      controller: PageController(viewportFraction: customViewportFraction),
      onPageChanged: (int index) {
        setState(() => _index = index);
      },
      pageSnapping: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int itemIndex) {
        return _buildCarouselItem(context, itemIndex, items);
      },
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int itemIndex, List<Item> items) {
    var i = items[itemIndex];
    return Transform.scale(
        scale: itemIndex == _index ? 0.9 : 0.7,
        child: widget.detailMode
            ? carrousselDetailItem(i, widget.textColor)
            : carrousselDefault(i, widget.textColor));
  }
}

Widget carrousselDetailItem(Item item, Color textColor) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(item.name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600, fontSize: 28)),
    ),
    Expanded(
        child: GestureDetector(
            onTap: () => navigatorKey.currentState
                .pushNamed('/details', arguments: item),
            child: Row(children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: ItemPoster(item, showName: false))),
                    ],
                  )),
              Expanded(
                flex: 3,
                child: Card(
                    elevation: 6,
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(children: [
                          Row(children: [
                            Critics(item, textColor: Colors.black),
                            Spacer(),
                            if (item.runTimeTicks != null)
                              Text(
                                printDuration(Duration(
                                    microseconds:
                                        (item.runTimeTicks / 10).round())),
                                style: TextStyle(color: Colors.black),
                              )
                          ]),
                          if (item.overview != null) Divider(),
                          if (item.overview != null)
                            Expanded(
                                flex: 1,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(
                                      removeAllHtmlTags(item.overview),
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    )))
                        ]))),
              )
            ])))
  ]);
}

Widget carrousselDefault(Item item, Color textColor) {
  return GestureDetector(
      onTap: () =>
          navigatorKey.currentState.pushNamed('/details', arguments: item),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Hero(
                    tag: 'poster-${item.id}',
                    child: AsyncImage(
                      returnImageId(item),
                      item.imageBlurHashes,
                      boxFit: BoxFit.contain,
                    ))),
            Text(item.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22)),
          ]));
}