import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dart:convert'; // 用于 JSON 编码和解码
import 'package:http/http.dart' as http; // 导入 http 包

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
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // 主体内容区域
  Widget _buildBody() {
    return Container(
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
                    _buildPhoneText(),
                    const SizedBox(height: 8),
                    const Text(
                      '中国电信提供认证服务',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 40),
                    _buildLoginButton(),
                    const SizedBox(height: 16),
                    _buildOtherLoginOption(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 手机号文本
  Widget _buildPhoneText() {
    return const Text(
      '177****5412',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  // 登录按钮
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : () async => await loginWithPhone(),
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
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Center(
            child:
                isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                      '手机一键登录',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
          ),
        ),
      ),
    );
  }

  // 其他登录方式
  Widget _buildOtherLoginOption() {
    return GestureDetector(
      onTap: () => debugPrint('LoginPage: 其他方式登录 clicked'),
      child: const Text(
        '其他方式登录',
        style: TextStyle(fontSize: 14, color: Colors.blue),
      ),
    );
  }

  // 底部协议条款
  Widget _buildBottomBar() {
    return Padding(
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
            onTap: () => debugPrint('用户协议或隐私政策 clicked'),
            child: const Text(
              '我已阅读并同意《用户协议》和《隐私政策》',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
