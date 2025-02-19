import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ParentingAnimationWidget extends StatefulWidget {
  const ParentingAnimationWidget({super.key});

  @override
  State createState() => ParentingAnimationWidgetState();
}

class ParentingAnimationWidgetState extends State<ParentingAnimationWidget>
    with TickerProviderStateMixin {
  late Animation opacityTween;
  late Animation widthTween;
  late Animation stopTween;
  late AnimationController _controller;

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 3100), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _controller.reset(); // 在动画状态是完成的时候，再进行重置
            _controller.forward(); // 在动画状态是完成的时候，再进行开始动画。
          });
        }
      });

    stopTween = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));

    widthTween = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    opacityTween = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('歌词遮罩显示'),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Stack(
                children: <Widget>[
                  ShaderMask(
                    child: Center(
                        child: Text(
                      '天青色等烟雨,而我在等你',
                      style: TextStyle(fontSize: 18),
                    )),
                    shaderCallback: (rect) {
                      return LinearGradient(
                        colors: [
                          Colors.greenAccent,
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [stopTween.value, 1],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.srcATop,
                  ),
                  Opacity(
                    opacity: opacityTween.value,
                    child: Center(
                        child: Text(
                      '天青色等烟雨,而我在等你',
                      style: TextStyle(color: Colors.black38, fontSize: 18),
                    )),
                  )
                ],
              ));
        },
      ),
    );
  }
}
