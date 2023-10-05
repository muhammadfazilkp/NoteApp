import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:note_app/controller/regestring_adapter/adapter.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/view/presentation/screens/homescreen/homescreen.dart';
import 'package:note_app/view/presentation/screens/spalsh/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Hive.initFlutter();

  // Register your custom adapter for the Note class
  if (!Hive.isAdapterRegistered(CustomNoteAdapter().typeId)) {
    Hive.registerAdapter(CustomNoteAdapter());
  }

  await Hive.openBox<Note>('notes');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CrudOpretion())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 206, 206, 12)),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
      ),
    );
  }
}
