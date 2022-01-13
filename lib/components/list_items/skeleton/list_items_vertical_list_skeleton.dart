part of 'list_items_skeleton.dart';

class ListItemsVerticalSkeleton extends StatelessWidget {
  final count;
  ListItemsVerticalSkeleton({this.count = 10});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: shimmerColor1,
        highlightColor: shimmerColor2,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) => SkeletonItemPoster(
                  height: verticalListPosterHeight,
                  padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                )));
  }
}