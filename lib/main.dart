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
        // 设置背景图片
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
                // Logo 图片
                Image.asset(
                  'assets/images/default/login/logo.png', // Logo 图片路径
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 16),
                // 用户数量
                const Text(
                  '177****5412',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // 文本颜色调整为白色以适应背景
                  ),
                ),
                const SizedBox(height: 8),
                // 描述文本
                const Text(
                  '中国电信提供认证服务',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey, // 灰白色
                  ),
                ),
                const SizedBox(height: 40),
                // 手机一键登录按钮（设置背景图片）
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: 实现登录逻辑
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24), // 更圆润的边角
                      ),
                      backgroundColor: Colors.transparent, // 背景透明
                      shadowColor: Colors.transparent, // 去除阴影
                      elevation: 0, // 去除默认高度
                    ),
                    child: Container(
                      width: double.infinity, // 确保 Container 宽度填充整个按钮
                      height: 48, // 调整高度以匹配截图
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/default/login/button_background.png',
                          ), // 按钮背景图片
                          fit: BoxFit.cover, // 图片填充方式
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(24)),
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
                // 其他方式登录（可点击文本）
                GestureDetector(
                  onTap: () {
                    // TODO: 实现其他登录方式
                  },
                  child: const Text(
                    '其他方式登录',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 24),
                // 底部协议单选框
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                      checkColor: Colors.blue,
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: 打开用户协议
                      },
                      child: const Text(
                        '我已阅读并同意《用户协议》和 《隐私政策》',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
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
