part of tree_force_layout;

class Box extends StatelessWidget {
  final String id;
  final Insets margin;
  final Insets padding;
  final Length width;
  final Length height;
  final List<String> classes;
  final List<Widget> children;

  const Box({
    dynamic key,
    this.id,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.classes,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Margin(
        insets: margin,
        child: Padding(
            insets: padding,
            child: Size(
                width: width,
                height: height,
                child: Container(
                  key: key,
                  id: id,
                  classes: classes,
                  children: children,
                ))));
  }
}
