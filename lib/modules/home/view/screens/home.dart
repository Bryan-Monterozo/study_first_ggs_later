import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/home/view/widgets/home_widgets.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyHome extends StatefulWidget {
  static const String routeName = '/';
  const StudyHome({super.key});

  @override
  State<StudyHome> createState() => _HomeState();
}

class _HomeState extends State<StudyHome> {
  NavController navController = Get.put(NavController());

  @override
  void initState() {
    navController.initNav(
      currentRoute: CurrentRoute.home,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: SharedAppBar(
          titlePic: titlePic(context),
          withPic: withPic(context),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 400.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0B6BA7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Align(
                            alignment: const Alignment(0.8, 0.0),
                            child: SizedBox(
                              width: 10.0,
                              height: 20.0,
                              child: OverflowBox(
                                minWidth: 0.0,
                                maxWidth: 150.0,
                                minHeight: 0.0,
                                maxHeight: 150.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: kIsWeb
                                          ? Image.network(
                                              'assets/images/books.png',
                                              fit: BoxFit.fill,
                                              alignment:
                                                  const Alignment(0.00, -0.50),
                                            )
                                          : Image.asset(
                                              'assets/images/books.png',
                                              fit: BoxFit.fill,
                                              alignment:
                                                  const Alignment(0.00, -0.50),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: 300.0,
                        height: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  'Studying is Fun!',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  'Explore the enjoyable side of studying, where curiosity and discovery make learning a truly exciting experience.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: HomeNavGesture(
                                    // navigator: HomeNavButtonWidget(),
                                    navContainer: HomeNavGetStarted(
                                      homeNavColor: Colors.white,
                                      homeNavColorText: Color(0xFF0B6BA7),
                                      homeNavHeight: 30,
                                      homeNavWidth: 130,
                                      homeNavText: 'Get Started',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeNavGesture(
                          // navigator: HomeNavButtonWidget(),
                          navContainer: HomeNavButtonWidget(
                            homeNavColor: Colors.white,
                            homeNavColorText: Color(0xFF0B6BA7),
                            homeNavHeight: 200,
                            homeNavWidth: 140,
                            homeNavText: const Text(
                              'Pomodoro',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF0B6BA7),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            navContent: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: kIsWeb
                                          ? Image.network(
                                              'assets/images/time-management.png',
                                              fit: BoxFit.fill,
                                              alignment:
                                                  const Alignment(0.00, -0.50),
                                            )
                                          : Image.asset(
                                              'assets/images/time-management.png',
                                              fit: BoxFit.fill,
                                              alignment:
                                                  const Alignment(0.00, -0.50),
                                            ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Study effieciently by using Pomodoro!',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0B6BA7),
                                    fontSize: 8,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        HomeNavGesture(
                          // navigator: HomeNavButtonWidget(),
                          navContainer: HomeNavButtonWidget(
                            homeNavColor: Colors.transparent,
                            homeNavColorText: Color(0xFF0B6BA7),
                            homeNavHeight: 200,
                            homeNavWidth: 240,
                            homeNavText: Container(),
                            navContent: SizedBox(
                                width: 240, height: 200, child: homeCalendar()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
