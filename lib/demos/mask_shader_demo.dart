import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class ImageShaderExample extends StatefulWidget {
  const ImageShaderExample({super.key});

  @override
  State createState() => _ImageShaderExampleState();
}

class _ImageShaderExampleState extends State<ImageShaderExample> {
  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<ui.Image> _loadImage() async {
    // 加载本地图片文件
    final ByteData data = await rootBundle.load('assets/heart_top_mask.png');
    final List<int> bytes = data.buffer.asUint8List();

    // 解码图像数据并返回ui.Image
    final ui.Codec codec =
        await ui.instantiateImageCodec(Uint8List.fromList(bytes));
    final ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ImageShader Example')),
      body: _textShader(),
    );
  }

  _randialShader() {
    return Center(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            center: Alignment.center, // 渐变的中心
            radius: 1, // 渐变的半径
            colors: [Colors.blue, Colors.transparent], // 渐变的颜色列表
            tileMode: TileMode.mirror, // 定义渐变边缘如何处理
          ).createShader(bounds); // 创建着色器并返回
        },
        blendMode: BlendMode.dstIn, // 用渐变颜色覆盖文字
        child: Container(
          // color: Colors.white,
          width: 200,
          height: 200,
          child: Container(
            color: Colors.transparent,
            width: 100,
            height: 100,
            child: Text(
              'Hello ShaderMask!',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textShader() {
    return Stack(
      children: [
        // Container(
        //   color: Colors.black,
        // ),
        Center(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [Colors.yellow, Colors.pink, Colors.purple],
                // stops: [0.0, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn, // 用渐变颜色覆盖文字
            // child: Image.asset('assets/good.png'),
            child: Container(
              color: Colors.transparent,
              child: Text(
                'Hello ShaderMask!',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  FutureBuilder<ui.Image> _imageMask() {
    return FutureBuilder(
      future: _loadImage(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const CircularProgressIndicator();
        }
        return Center(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              // 计算缩放因子，将图像调整为适应 bounds
              double scaleX = bounds.width / snapshot.data!.width;
              double scaleY = bounds.height / snapshot.data!.height;

              // 创建一个变换矩阵，根据 bounds 设置图像的缩放和平移
              Matrix4 matrix = Matrix4.identity()
                ..scale(scaleX, scaleY) // 根据 bounds 缩放
                ..translate(bounds.left, bounds.top); // 将图像平移到指定位置
              return ImageShader(
                snapshot.data!,
                TileMode.clamp,
                TileMode.clamp,
                matrix.storage, // 这里可以设置变换矩阵
              );
            },
            blendMode: BlendMode.dstIn,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red, // 你可以选择一个背景色
              child: const Center(
                child: Text(
                  'Image Shader Mask',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
