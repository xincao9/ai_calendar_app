import 'package:flutter/material.dart';
import 'app_name.dart';
import 'logo.dart';
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
    return Scaffold(body: _buildBody(), bottomNavigationBar: _buildBottomBar());
  }

  // 主体内容区域
  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topLeft,
          image: AssetImage('assets/images/default/login/background.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 145),
              const Logo(width: 70),
              const SizedBox(height: 5),
              const AppName(width: 45),
              const SizedBox(height: 100),
              _buildPhoneText(),
              const SizedBox(height: 8),
              const Text(
                '中国电信提供认证服务',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 35),
              _buildLoginButton(),
              const SizedBox(height: 20),
              _buildOtherLoginOption(),
            ],
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
        fontSize: 26,
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
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        child: Ink(
          height: 50,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/default/login/button_background.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child:
                isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                      '手机一键登录',
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
        style: TextStyle(fontSize: 17, color: Colors.green),
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
