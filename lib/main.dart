import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar_provider.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: 'Study First, GGS Later',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           primarySwatch: Colors.yellow,
//           visualDensity: VisualDensity.adaptivePlatformDensity),
//       // home: const StudyHome(),
//     );
//   }
// }


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// int _selectedIndex = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MeetingProvider(),),
    ],
    child: GetMaterialApp(
      title: "Study First",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Product Sans'
      ),
      // ignore: prefer_const_constructors
      home: StudyHome(),
    ));
  }
}


