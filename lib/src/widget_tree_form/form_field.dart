part of widget_tree_form;

typedef FieldBuilder<T> = Widget Function(FormFieldState<T> formFieldState);
typedef ValueValidator<T> = String Function(T value);

class FormField<T> extends StatefulWidget {
  final T initialValue;
  final ValueValidator<T> validator;
  final FieldBuilder<T> builder;

  const FormField({
    dynamic key,
    this.initialValue,
    this.validator,
    this.builder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormFieldState(this, initialValue);
  }
}

class FormFieldState<T> extends State<FormField<T>> {
  T _value;
  String _errorMessage;
  bool _dirty = false;
  bool _touched = false;

  FormFieldState(FormField<T> widget, this._value) : super(widget) {
    _errorMessage = widget.validator != null ? widget.validator(_value) : null;
  }

  T get value => _value;

  String get errorMessage => _errorMessage;

  bool get isDirty => _dirty;

  bool get isPristine => !isDirty;

  bool get isTouched => _touched;

  bool get isUntouched => !isTouched;

  bool get isValid => _errorMessage == null;

  bool get isInvalid => !isValid;

  void setValue(T value) {
    if (value != _value) {
      setState(() {
        _value = value;
        _errorMessage = widget.validator != null ? widget.validator(_value) : null;
      });
    }
  }

  void setDirty() {
    if (_dirty == false) {
      setState(() => _dirty = true);
    }
  }

  void setTouched() {
    if (_touched == false) {
      setState(() => _touched = true);
    }
  }

  @override
  Widget build() {
    return widget.builder(this);
  }
}