import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desktop/constant/theme.dart';
import 'home_page.dart';

// 登录页面
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool login = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _userName = "";
  String _passWord = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("asset/login_background.png"), fit: BoxFit.cover)
          //color: Color(0xffbcbece)
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Flexible(flex: 3, child: Container()),
            Flexible(flex: 2, child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                child: Container(
                  decoration: BoxDecoration(color: const Color(0x33fafffa),
                      border: Border(left: BorderSide(color: Color(0x77ffffff), width: 1.0))
                  ),
                  alignment: Alignment.center,
                  child: SizedBox( width: 360,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('asset/logo.png')),
                        SizedBox(height: 30),
                        _commonInput(controller: _usernameController, callback: (value)=>_userName=value, lableText: "账号"),
                        _commonInput(controller: _passwordController, callback: (value)=>_passWord=value, lableText: "密码"),
                        const SizedBox(height: 30),
                        _Button1(content: "登录"),
                        const SizedBox(height: 20),
                        _Button2(content: "没有账号？去注册")
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> Login() async {
    Navigator.pop(context);
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const HomePage()),);
  }

  Future<void> SignUp() async {

  }

  Widget _commonInput({required TextEditingController controller,
        required callback,
        required String lableText}){
    return SizedBox(
      width: 280,
      child: TextField(
        controller: controller,
        onChanged: callback,
        style: const TextStyle(color: AppColor.deepSecondary, fontSize: 14),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.secondary),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.deepSecondary),
            ),
            labelText: lableText,
            labelStyle: const TextStyle(color: AppColor.deepSecondary)
        ),
      ),
    );
  }

  Widget _Button1({required String content}) {
    return InkWell(
      child: Container(
        width: 280, height: 48, alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Color(0xff163216)
        ),
        child: Text(content, style: TextStyle(color: Color(0xfffafffa),),)
      ),
      onTap: ()=>Login(),
    );
  }

  Widget _Button2({required String content}) {
    return InkWell(
        child: Container(
          width: 280, height: 48, alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Color(0xfffafffa)
          ),
          child: Text(content, style: TextStyle(color: Color(0xff163216),),),
        )
    );
  }
}
