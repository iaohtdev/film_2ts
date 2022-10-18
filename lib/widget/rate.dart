
import 'package:flutter/material.dart';

typedef IconBuilder = Icon Function(double value, int index);

class Rate extends StatefulWidget {
  final bool allowHalf;

  final bool allowClear;

  final bool readOnly;

  final double iconSize;

  final Color color;

  final double initialValue;


  final IconBuilder? iconBuilder;

  const Rate({
    Key? key,
    this.allowHalf = false,
    this.allowClear = true,
    this.readOnly = false,
    this.iconSize = 24,
    this.color = Colors.yellow,
    this.initialValue = 0.0,
    this.iconBuilder,
  }) : super(key: key); 

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  double _value = 0;
  double? _hoverValue;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildStar(2),
        _buildStar(4),
        _buildStar(6),
        _buildStar(8),
        _buildStar(10),
      ],
    );
  }

  Widget _buildStar(int index) {
    var icon =
        widget.iconBuilder?.call(_value, index) ?? _defaultIconBuilder(index);


    return icon;
  }

  Icon _defaultIconBuilder(int index) {
    var icon = (_hoverValue ?? _value) > index.toDouble()
        ? Icons.star
        : Icons.star_border;

    if (widget.allowHalf && (_hoverValue ?? _value) == (index + 0.5)) {
      icon = Icons.star_half;
    }

    return Icon(icon, size: widget.iconSize, color: widget.color);
  }
}