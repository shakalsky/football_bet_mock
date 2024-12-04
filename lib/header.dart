import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  final double height;
  final bool showMainIcon;
  final bool showBackIcon;
  final IconData? icon;
  final Function? routeBack;

  const HeaderWidget({
    Key? key,
    required this.height,
    this.showMainIcon = false,
    this.showBackIcon = false,
    this.icon,
    this.routeBack,
  }) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, widget.height),
            Offset(width / 10 * 5, widget.height - 60),
            Offset(width / 5 * 4, widget.height + 20),
            Offset(width, widget.height - 18)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 3, widget.height + 20),
            Offset(width / 10 * 8, widget.height - 60),
            Offset(width / 5 * 4, widget.height - 60),
            Offset(width, widget.height - 20)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, widget.height),
            Offset(width / 2, widget.height - 40),
            Offset(width / 5 * 4, widget.height - 80),
            Offset(width, widget.height - 20)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        Row(
          children: [
            if (widget.showBackIcon)
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => widget.routeBack!(),
                ),
              ),
            const Spacer(),
            Visibility(
              visible: widget.showMainIcon,
              child: SizedBox(
                height: widget.height - 40,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      top: 10.0,
                      right: 5.0,
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                      border: Border.all(width: 5, color: Colors.white),
                    ),
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            if (widget.showBackIcon) const SizedBox(width: 40.0),
          ],
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  final List<Offset> _offsets;
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);

    path.quadraticBezierTo(_offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(_offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
