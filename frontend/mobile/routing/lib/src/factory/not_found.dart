import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final error = theme.textTheme.display3.apply(color: theme.errorColor);
    return Material(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.error_outline,
              size: error.fontSize,
              color: error.color
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('404',
                style: error,
              ),
            )
          ]
        ),
      ),
    );
  }

}