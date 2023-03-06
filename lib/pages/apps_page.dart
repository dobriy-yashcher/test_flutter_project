import 'package:flutter/material.dart';

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Приложения"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/');
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.8,
              child: const ListMaker(numberOfItems: 24),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height * 0.124,
            child: Card(
              color: const Color.fromARGB(100, 158, 158, 158),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const ListMaker(numberOfItems: 4),
            )));
  }
}

class ListMaker extends StatelessWidget {
  final int numberOfItems;

  const ListMaker({super.key, required this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: numberOfItems,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: const Color.fromARGB(0, 255, 193, 7),
            elevation: 0,
            child: IconButton(
              iconSize: 80,
              padding: const EdgeInsets.all(0),
              icon: const Icon(Icons.telegram_sharp),
              onPressed: () {},
            ));
      },
    );
  }
}
