import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar(
      {super.key,
      this.title,
      this.actions,
      this.withPic,
      this.titlePic,
      this.leading});

  final String? title;
  final List<Widget>? actions;
  final Widget? withPic;
  final Widget? titlePic;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Color(0xFF1C1C1C),
      ),
      leading: leading == null
          ? IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            )
          : leading!,
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
    padding: const EdgeInsetsDirectional.all(12),
    decoration:  BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(12)
    ),
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: kIsWeb
            ? Image.network(
                'assets/images/dp.jpg',
                fit: BoxFit.fill,
                alignment: const Alignment(0.00, -0.50),
              )
            : Image.asset(
                'assets/images/dp.jpg',
                fit: BoxFit.fill,
                alignment: const Alignment(0.00, -0.50),
              ),
      ),
    ),
  );
}

Widget titlePic(BuildContext context) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: kIsWeb
          ? Image.network(
              'assets/images/logo.png',
              width: 160,
              height: 50,
              fit: BoxFit.fitHeight,
              alignment: const Alignment(0.00, 0.00),
            )
          : Image.asset(
              'assets/images/logo.png',
              width: 160,
              height: 50,
              fit: BoxFit.fitHeight,
              alignment: const Alignment(0.00, 0.00),
            ));
}

Widget leadingBack(BuildContext context) {
  return IconButton(
    icon: const Icon(
      Icons.arrow_back_ios_new,
      color: Colors.black,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
// if (withPic != null) withPic!, ...?actions