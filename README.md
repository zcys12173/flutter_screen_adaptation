# Flutter屏幕适配插件

## 引用
`pubspec.yaml`中添加
```yaml
dependencies:
  flutter_screen_adaptation: ^0.0.2
```
## 用法
- 初始化  
  `await ScreenAdaptation.init(800, 600);` 传入设计稿的宽和高
- 使用  
  `x.wdp`:根据宽度适配；`x.hdp`:根据高度适配；
- 完整用例
```dart
import 'package:flutter/material.dart';

import 'package:flutter_screen_adaptation/flutter_screen_adaptation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenAdaptation.init(800, 600);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Container(width: 400.wdp, height:300.hdp,color: Colors.green,),
        ),
      ),
    );
  }
}

```

