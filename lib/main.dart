import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // 导入 http 包
import 'dart:convert'; // 用于 JSON 编码和解码

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('MyApp: Building MaterialApp');
    return MaterialApp(
      title: '登录页面',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isLoading = false; // 控制加载状态

  // 定义调用 HTTP 接口的方法
  Future<void> loginWithPhone() async {
    setState(() {
      isLoading = true; // 显示加载状态
    });

    try {
      // 假设接口是 https://api.example.com/login
      final url = Uri.parse('https://api.example.com/login');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // 设置请求头
        },
        body: jsonEncode({
          'phone': '177****5412', // 示例参数：手机号
        }),
      );

      // 检查响应状态
      if (response.statusCode == 200) {
        // 成功响应
        final data = jsonDecode(response.body);
        debugPrint('登录成功: $data');
      } else {
        debugPrint('登录失败: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      // 捕获异常
      debugPrint('请求出错: $e');
    } finally {
      setState(() {
        isLoading = false; // 隐藏加载状态
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('LoginPage: Building Scaffold');
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/default/login/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/default/login/logo.png',
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '177****5412',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '中国电信提供认证服务',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              isLoading
                                  ? null // 禁用按钮当正在加载时
                                  : () async {
                                    debugPrint('LoginPage: 手机一键登录按钮 clicked');
                                    await loginWithPhone(); // 调用 HTTP 接口
                                  },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 48,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/default/login/button_background.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            child: Center(
                              child:
                                  isLoading
                                      ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      ) // 显示加载指示器
                                      : const Text(
                                        '手机一键登录',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          debugPrint('LoginPage: 其他方式登录 clicked');
                        },
                        child: const Text(
                          '其他方式登录',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
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
                      debugPrint('LoginPage: 用户协议或隐私政策 clicked');
                    },
                    child: const Text(
                      '我已阅读并同意《用户协议》和《隐私政策》',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
