part of '../fields.dart';

class GenresField extends StatelessWidget {
  final Item item;
  final FormGroup form;
  final double ITEM_HEIGHT = 50;

  const GenresField({Key? key, required this.form, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Genres', style: Theme.of(context).textTheme.headline6),
        SizedBox(height: 24),
        SizedBox(
          height: (ITEM_HEIGHT * (item.genreItems?.length ?? 0)).toDouble(),
          width: double.maxFinite,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: item.genreItems?.length ?? 0,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                personItem(item.genreItems?.elementAt(index), index, context),
          ),
        ),
      ],
    );
  }

  Widget personItem(GenreItem? genreItem, int index, BuildContext context) {
    if (genreItem == null) return SizedBox();
    final headlineColor = Theme.of(context).textTheme.headline6!.color;
    return SizedBox(
      height: ITEM_HEIGHT,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(genreItem.name!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: headlineColor!.withAlpha(180))),
              ),
              Spacer(),
              IconButton(
                  onPressed: () => item.people?.removeAt(index),
                  hoverColor: Colors.red.withOpacity(0.1),
                  icon: Icon(Icons.delete_outline, color: Colors.red))
            ]),
      ),
    );
  }
}