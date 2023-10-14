import 'package:flutter/material.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:note_app/view/presentation/screens/homescreen/homescreen.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CrudOpretion>(context, listen: false).getNotes();
    navigator(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/fasil-02.png'),
               fit: BoxFit.cover),
        ),
      ),
    );
  }

  Future<void> navigator(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }
}
