import 'package:flutter/material.dart';

//TODO: Place Holder muna mga to dapat yung mga title, and eme is maging object for reusability
// @jhnpaulogrc kaw mag aayos nito

class DrawerNavButton extends StatelessWidget {
  final String? navText;
  final IconData? navIcon;

  const DrawerNavButton({super.key, required this.navText, required this.navIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 12, 12),
              child: Container(
                width: 4,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF6F61EF),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Icon(
              navIcon!,
              color: const Color(0xFF15161E),
              size: 28,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                navText!,
                style: const TextStyle(
                  fontFamily: 'Product Sans',
                  color: Color(0xff1c1c1c),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
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
                      child: Image.network(
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
                            fontFamily: 'Product Sans',
                            color: Color(0xFF15161E),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'ryanmikes@gmail.com',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              color: Color(0xFF606A85),
                              fontSize: 14,
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
