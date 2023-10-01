import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar(
      {super.key, this.title, this.actions, this.withPic, this.titlePic});

  final String? title;
  final List<Widget>? actions;
  final Widget? withPic;
  final Widget? titlePic;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Color(0xFF1C1C1C),
      ),
      title: titlePic == null
          ? Text(
              title!,
              style: const TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )
          : titlePic!,
      actions: withPic == null ? actions : [withPic!],
      centerTitle: true,
      elevation: 0,
    );
  }
}

Widget withPic(BuildContext context) {
  return Container(
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
          ),
  );
}

Widget titlePic(BuildContext context) {
  return ClipRRect(
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
            ));
}


// if (withPic != null) withPic!, ...?actions