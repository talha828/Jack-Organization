import 'package:flutter/material.dart';
import 'package:jack_delivery/component/constant/constant.dart';

class LoadingIndicator extends StatefulWidget {
  @override
  State createState() {
    return _LoadingIndicatorState();
  }
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _cont;
  late Animation<Color?> _anim;

  @override
  void initState() {
    _cont = AnimationController(
        duration: Duration(
          seconds: 1,
        ),
        vsync: this);
    _cont.addListener(() {
      setState(() {
        //print("val: "+_cont.value.toString());
      });
    });
    ColorTween col =
    ColorTween(begin: appYellowColor, end:appBlueColor);
    _anim = col.animate(_cont);
    _cont.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _cont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        child: Center(
          child: Container(
              width: 50 * _cont.value,
              height: 50 * _cont.value,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  _anim.value,
                ),
              )),
        ));
  }
}
