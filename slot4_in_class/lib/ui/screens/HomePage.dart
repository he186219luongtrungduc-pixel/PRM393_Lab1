import 'package:flutter/material.dart';

import '../widgets/MyAppBar.dart';
import '../widgets/BodyWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const MyAppBar(), body: const BodyWidget());
  }
}
