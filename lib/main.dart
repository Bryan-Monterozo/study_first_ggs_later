import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:study_first_ggs_later/modules/auth/view/sceens/login.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/meeting_provider.dart';
// import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';
// import 'package:study_first_ggs_later/modules/auth/view/sceens/signup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ignore: unused_local_variable
  final db = FirebaseFirestore.instance;
  // await db
  //   .enablePersistence(const PersistenceSettings(synchronizeTabs: true));
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}


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
          fontFamily: 'Product Sans'),
      // ignore: prefer_const_constructors
      home: Login(),
    ));
  }
}
