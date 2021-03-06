part of tree_force;

class Length {
  final num value;
  final String unit;

  const Length._(this.value, this.unit);

  @override
  String toString() {
    return '$value$unit';
  }
}

class PixelLength extends Length {
  const PixelLength._(int pixel) : super._(pixel, 'px');
}

class PercentageLength extends Length {
  const PercentageLength._(num percentage) : super._(percentage, '%');
}

class FontSizeLength extends Length {
  const FontSizeLength._(num fontSize) : super._(fontSize, 'em');
}

Length pixel(int pixel) => PixelLength._(pixel);

Length percentage(num percentage) => PercentageLength._(percentage);

Length fontSize(num fontSize) => FontSizeLength._(fontSize);

const fullLength = PercentageLength._(100);

class Insets {
  final Length top;
  final Length right;
  final Length bottom;
  final Length left;

  Insets({this.top, this.right, this.bottom, this.left});

  Insets.all(Length length) : this(left: length, right: length, top: length, bottom: length);

  Insets.horizontal(Length horizontal) : this(left: horizontal, right: horizontal);

  Insets.vertical(Length vertical) : this(top: vertical, bottom: vertical);

  Insets.symmetric({Length horizontal, Length vertical}) : this(left: horizontal, right: horizontal, top: vertical, bottom: vertical);
}
