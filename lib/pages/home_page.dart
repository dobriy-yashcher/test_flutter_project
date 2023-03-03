import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  String title = "Список дел";
  bool isDefaultAppBar = true;
  String searchText = "";

  bool _showButton = true;

  TextEditingController searchController = TextEditingController();

  Widget getCurrentPage(int index) {
    final listPages = [
      // DealsPage(searchText),
      // const CalendarPage(),
      // const CardPage(),
    ];

    return listPages[index];
  }

  AppBar getSerchAppBar(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isDefaultAppBar = !isDefaultAppBar;
            });
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: const Icon(Icons.exit_to_app))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: getSerchAppBar(context),
    );
  }
}
