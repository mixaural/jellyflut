part of '../list_items_parent.dart';

class ListItemsGrid extends StatelessWidget {
  final List<Item> items;
  final ScrollController scrollController;
  final ScrollPhysics scrollPhysics;
  final double gridPosterHeight;
  final BoxFit boxFit;
  final Widget Function(BuildContext)? placeholder;

  const ListItemsGrid(
      {Key? key,
      this.boxFit = BoxFit.cover,
      this.placeholder,
      required this.scrollPhysics,
      required this.scrollController,
      required this.gridPosterHeight,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height =
          gridPosterHeight.isInfinite ? itemPosterHeight : gridPosterHeight;
      final itemAspectRatio =
          items.first.getPrimaryAspectRatio(showParent: true);
      final numberOfItemRow =
          (constraints.maxWidth / (height * itemAspectRatio)).round();
      ;
      return CustomScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: items.first.getPrimaryAspectRatio(),
                    crossAxisCount: numberOfItemRow,
                    mainAxisExtent: height + itemPosterLabelHeight,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5),
                delegate:
                    SliverChildBuilderDelegate((BuildContext c, int index) {
                  return ItemPoster(
                    items.elementAt(index),
                    boxFit: boxFit,
                    placeholder: placeholder,
                    width: double.infinity,
                    height: double.infinity,
                  );
                }, childCount: items.length))
          ]);
    });
  }
}
