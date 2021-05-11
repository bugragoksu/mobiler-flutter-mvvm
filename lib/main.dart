import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/job_view.dart';
import 'view_model/job_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => JobViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: JobView(),
      ),
    );
  }
}
