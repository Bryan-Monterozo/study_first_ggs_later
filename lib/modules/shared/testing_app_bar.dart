import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Color(0xFF1C1C1C),
      ),
      title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: kIsWeb
              ? Image.network(
                  'assets/images/Rectangle1.png',
                  width: 115,
                  height: 52,
                  fit: BoxFit.fitHeight,
                  alignment: const Alignment(0.00, 0.00),
                )
              : Image.asset(
                  'assets/images/Rectangle1.png',
                  width: 115,
                  height: 52,
                  fit: BoxFit.fitHeight,
                  alignment: const Alignment(0.00, 0.00),
                )),
      actions: [
        Container(
            width: 80,
            height: 80,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: kIsWeb
                ? Image.network(
                    'assets/images/Ellipse1.png',
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.00, -0.50),
                  )
                : Image.asset(
                    'assets/images/Ellipse1.png',
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.00, -0.50),
                  ))
      ],
      centerTitle: true,
      elevation: 0,
    );
  }
}
