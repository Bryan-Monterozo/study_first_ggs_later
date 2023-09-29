import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';


void main() {
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
    return MaterialApp(
      title: "Study First",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const StudyHome(),
    );
  }
}



// class MenuBar extends StatefulWidget {
//   const MenuBar({super.key});

//   @override
//   State<MenuBar> createState() => _MenuBarState();
// }

// class _MenuBarState extends State<MenuBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Study First'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//                 decoration: const BoxDecoration(
//                   color: Colors.orange,
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30)),
//                     )
//                   ],
//                 )),
//             const ListTile(
//               leading: Icon(
//                 Icons.home,
//                 size: 20,
//                 color: Colors.black,
//               ),
//               title: Text(
//                 'Home',
//                 style: TextStyle(fontSize: 20),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
