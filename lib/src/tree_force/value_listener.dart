part of tree_force;

typedef ValueChangeCallback = void Function(String value);

class ValueListener extends DecoratorRenderWidget {
  final ValueChangeCallback onInput;

  const ValueListener({this.onInput, Widget child}) : super(child: child);

  @override
  ValueListenerTreeNode createTreeNode() {
    return ValueListenerTreeNode(this);
  }
}

class ValueListenerTreeNode extends DecoratorRenderTreeNode<ValueListener> {
  ValueListenerTreeNode(ValueListener widget) : super(widget);

  @override
  void decorate(RenderTreeNode<RenderWidget> child) {
    if (widget.onInput != null) {
      _htmlNode.addListener('oninput', (html.Event e) => widget.onInput((e.target as html.InputElement).value));
    }
  }
}
