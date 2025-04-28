import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登录页面',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 设置渐变背景
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/default/login/background.png',
            ), // 背景图片路径
            fit: BoxFit.cover, // 图片填充方式（覆盖整个容器）
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo 占位符
                Image.asset(
                  'assets/images/default/login/logo.png', // Logo 图片路径
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 16),
                // 手机号
                const Text(
                  '177****5412',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // 描述文本
                const Text(
                  '中国电信提供认证服务',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),
                // 手机一键登录按钮
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: 实现登录逻辑
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.transparent, // 背景透明
                      shadowColor: Colors.transparent, // 去除阴影
                      elevation: 0, // 去除默认高度
                    ),
                    child: Container(
                      width: double.infinity, // 确保 Container 宽度填充整个按钮
                      height: 56, // 明确设置高度，确保图片有足够空间
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/default/login/button_background.png',
                          ), // 按钮背景图片
                          fit: BoxFit.cover, // 图片填充方式
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Center(
                        child: Text(
                          '手机一键登录',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                // 其他方式登录（改为可点击文本）
                GestureDetector(
                  onTap: () {
                    // TODO: 实现其他登录方式
                  },
                  child: const Text(
                    '其他方式登录',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline, // 添加下划线以提示可点击
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // 底部协议单选框
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text('我已阅读并同意《用户协议》'),
                    const SizedBox(width: 16),
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text('《隐私政策》'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
