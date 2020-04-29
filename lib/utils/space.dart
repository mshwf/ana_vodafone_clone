import 'package:flutter/material.dart';

List<Widget> withSpace(
    {double verticalSpace, double horizontalSpace, Iterable<Widget> children}) {
  assert(horizontalSpace != null || verticalSpace != null,
      'Consider using Row/Column if no need to add spaces between widgets');
  assert((horizontalSpace != null) ^ (verticalSpace != null),
      'either horizontalSpace or verticalSpace should be specified.');
  return children
      .expand((item) sync* {
        yield SizedBox(height: verticalSpace);
        yield item;
      })
      .skip(1)
      .toList();
}
