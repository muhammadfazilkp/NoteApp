import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/view/presentation/screens/add_note_page/add_note.dart';
import 'package:note_app/view/presentation/screens/edit_page/edit_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, Key? y});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// List<Color> cardColors = [
//   const Color.fromARGB(255, 163, 66, 59),
//   Colors.blue,
//   Colors.green,
//   Colors.yellow,
//   Colors.orange,
//   Colors.purple
// ];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        leading: const Icon(
          Icons.note_alt_sharp,
          size: 25,
        ),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Notes',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.purple,
            ),
          ),
        ),
      ),
      body: Consumer<CrudOpretion>(
        builder: (context, value, child) => Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/fasil.png'), fit: BoxFit.cover)),
          child: FutureBuilder<List<Note>>(
            future: value.getNotes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text('No notes available'),
                );
              } else {
                final notes = snapshot.data;

                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 8.0,
                    ),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final note = snapshot.data![index];
                      // final cardColor = cardColors[index % cardColors.length];
                      // final idx = index % 4;

                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Card(
                          elevation: 4.0,
                          color: Colors.pink[100],
                          child: InkWell(
                            onTap: () {
                              Provider.of<CrudOpretion>(context,listen: false).edit(note.title, note.content);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EditScreen()));
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Delete Note',
                                      style: GoogleFonts.poppins(),
                                    ),
                                    content: const Text(
                                        'Are you sure you want to delete this note?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          value.deleteNote(index);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          note.title,
                                          style: GoogleFonts.poppins(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Divider( color: Colors.black12,),
                                    const SizedBox(height: 8.0),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(note.content,
                                            style: GoogleFonts.poppins( ))),

                                    // Use note title here
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 112, 36, 204),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()));
        },
        label: Text(
          'Create Note',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
