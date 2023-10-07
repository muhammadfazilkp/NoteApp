import 'package:flutter/material.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Consumer<CrudOpretion>(
          builder: (context, value, child) => WillPopScope(
            onWillPop: () async {
              // Access the CrudOpretion provider
              final crudProvider =
                  Provider.of<CrudOpretion>(context, listen: false);

              crudProvider.edit(
                crudProvider.editTitleController.text,
                crudProvider.editContentController.text,
              );

              return true;
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: TextField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        maxLines: null,
                        controller: value.editTitleController,
                      ),
                    ),
                    const Divider(
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        maxLines: null,
                        controller: value.editContentController,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
