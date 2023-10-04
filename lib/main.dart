import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/view/presentation/screens/homescreen/homescreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  runApp(const MyApp());
    if (!Hive.isAdapterRegistered(Note(title: '', content: '')().typeId)) {
    Hive.registerAdapter(Note());}
  await Hive.initFlutter();
   await Hive.openBox('notes');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CrudOpretion())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 206, 206, 12)),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
