import 'package:flutter/material.dart';

String name = "Flutter";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  Widget auth(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        actions: const [Icon(Icons.info)],
      ),
      drawer: const Drawer(),
      body: auth(context),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: const ListTile(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )),
          tileColor: Colors.blue,
          title: Text("Hello"),
          subtitle: Text("andinawndaw"),
        ),
      ),
    );
  }
}
