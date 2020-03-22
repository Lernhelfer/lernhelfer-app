import 'package:flutter/material.dart';

class FlatCheckBoxTextButton extends StatelessWidget {
  final bool value;
  final String text;
  final Function onChecked;
  final Function onUnchecked;

  FlatCheckBoxTextButton(
      {this.value, this.text, this.onChecked, this.onUnchecked});

  @override
  build(BuildContext context) {
    return FlatButton(
      child: Semantics(
        label: 'Load complete fahrplan checkbox',
        child: ExcludeSemantics(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Checkbox(
                  value: value,
                  onChanged: null,
                  checkColor: Theme.of(context).toggleableActiveColor,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  text,
                  style: (onChecked != null && onUnchecked != null)
                      ? Theme.of(context).textTheme.subtitle
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: onCheckedUnchecked,
    );
  }

  void onCheckedUnchecked() {
    if (value) {
      onUnchecked();
    }
    onChecked();
  }
}
