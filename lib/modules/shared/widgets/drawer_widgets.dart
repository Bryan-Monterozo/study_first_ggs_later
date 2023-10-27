import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//TODO: Place Holder muna mga to dapat yung mga title, and eme is maging object for reusability
// @jhnpaulogrc kaw mag aayos nito

class DrawerNavButton extends StatelessWidget {
  final Widget? navText;
  final Widget? navIcon;
  final Color? navShadow;

  const DrawerNavButton(
      {super.key,
      required this.navText,
      required this.navIcon,
      this.navShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: navShadow!,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            navIcon!,
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: navText,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarStatus extends StatelessWidget {
  const NavBarStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Divider(
            height: 12,
            thickness: 2,
            color: Color(0xFFE5E7EB),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0x4D9489F5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF6F61EF),
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: kIsWeb
                          ? Image.network(
                              'assets/images/Ellipse1.png',
                              width: 44,
                              height: 44,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/Ellipse1.png',
                              width: 44,
                              height: 44,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User06969',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF15161E),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Text(
                            'ryanmikes@gmail.com',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF606A85),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
