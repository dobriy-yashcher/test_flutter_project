import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/pages/calendar_page.dart';
import 'package:test_project/pages/cards_page.dart';
import 'package:test_project/pages/deals_page.dart';

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
      DealsPage(searchText),
      const CalendarPage(),
      const CardsPage(),
    ];

    return listPages[index];
  }

  AppBar getDefaultAppBar(BuildContext context) {
    return AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  searchController.clear();
                  isDefaultAppBar = !isDefaultAppBar;
                });
              },
              icon: const Icon(Icons.close))
        ],
        title: TextField(
            controller: searchController,
            onChanged: (value) {
              setState(() {
                searchText = value.toLowerCase();
              });
            },
            decoration: const InputDecoration(label: Text("Название"))));
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
      appBar:
          isDefaultAppBar ? getSerchAppBar(context) : getDefaultAppBar(context),
      body: Container(child: getCurrentPage(index)),
      floatingActionButton: AnimatedOpacity(
          duration: const Duration(microseconds: 300),
          opacity: _showButton ? 1 : 0,
          child: FloatingActionButton(
              onPressed: () {}, child: const Icon(Icons.add))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_sharp),
            label: 'Список дел',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Календарь',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_carousel_outlined),
            label: 'Карточки',
          )
        ],
        onTap: ((value) {
          setState(() {
            index = value;
            _showButton = index == 0;

            switch (index) {
              case 0:
                title = "Список дел";
                break;
              case 1:
                title = 'Календарь';
                break;
              case 2:
                title = 'Карточки';
                break;
            }
          });
        }),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
