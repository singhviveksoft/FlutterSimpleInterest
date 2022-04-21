

import 'package:flutter/material.dart';

const String offline_status='offline';
const String online_status='online';

update(String msg,BuildContext context) {
  var snackbar = SnackBar(content: Text(msg));
  Scaffold.of(context).showSnackBar(snackbar);
}
