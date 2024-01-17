import 'package:flutter/material.dart';

class StyledSwitch extends StatefulWidget {
  final void Function(bool isToggled) onToggled;
  final double size;
  final bool defaultToggled;
  final Color enabledColor;
  final Color disabledColor;

  const StyledSwitch({
    this.onToggled = print,
    this.size = 25,
    this.defaultToggled = false,
// ignore: avoid_hard_coded_colors
    this.enabledColor = Colors.blue,
// ignore: avoid_hard_coded_colos
    this.disabledColor = const Color(0xFFD1D8DD),
    super.key,
  });

  @override
  State<StyledSwitch> createState() => _StyledSwitchState();
}

class _StyledSwitchState extends State<StyledSwitch> {
  bool isToggled = true;
  double size = 20;
  double innerPadding = 0;
  @override
  void initState() {
    isToggled = widget.defaultToggled;
    size = widget.size;

    innerPadding = size / 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      onPanEnd: (b) {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      child: AnimatedContainer(
        height: size,
        width: size * 2,
        padding: EdgeInsets.all(innerPadding),
        alignment: isToggled ? Alignment.centerLeft : Alignment.centerRight,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isToggled ? widget.enabledColor : widget.disabledColor,
        ),
        child: Container(
          width: size - innerPadding * 2,
          height: size - innerPadding * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            // color: isToggled ? widget.enabledColor : widget.disabledColor,
            // ignore: avoid_hard_coded_colors
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
