import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:employe_buses/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sso_plugin/sso_plugin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helper {
  String? _token;
  String? _refreshToken;
  String? _error;
  bool? determineTheInternetConnection;

  Future<void> requestSSOLogin() async {
    try {
      const appClientId = "MAIN_APP_AOPSE";
      const appClientSecret = "_69d67507701c27a225629e92a47757818b5f849850";
      Map<String, String> response =
          await SsoPlugin.doLogin(appClientId, appClientSecret);
      _token = response["SSOTOKEN"] ?? "";
      _refreshToken = response["SSOREFRESHTOKEN"] ?? "";
      print("token: $_token");
      print("refreshToken: $_refreshToken");
    } on Exception catch (e) {
      _error = e.toString();
    }
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.7,
            padding: const EdgeInsets.only(top: 25),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5)),
              color: Color(0xffF7D140),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 181,
                  height: 181,
                ),
              ],
            ),
          ),
          Container(
            height: 298,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: MediaQuery.of(context).size.height / 3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffFFFFFF),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 6,
                    color: Colors.grey.shade300),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontFamily: 'NotoKufiArabic',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xffF7D140),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/sso.png',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'نظام الدخول الموحد',
                        style: TextStyle(
                          fontFamily: 'NotoKufiArabic',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff8E8E92),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await initConnectivity();
                      if (determineTheInternetConnection == false) {
                        showSnackBar(
                            Context: context,
                            message: 'غير متصل بالانترنت حاليا',
                            error: true);
                      } else {
                        await requestSSOLogin();
                        await _token!=null? Navigator.pushReplacementNamed(context, '/drawer_bn_screen'):'';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 52),
                        backgroundColor: const Color(0xffF7D140)),
                    child: const Text(
                      'دخول',
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xff121212),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/drawer_bn_screen');
                        },
                        child: const Text(
                          'تخطي',
                          style: TextStyle(
                            fontFamily: 'NotoKufiArabic',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff8E8E92),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await Connectivity().checkConnectivity();
    } on PlatformException catch (e) {
      print("Error Occurred: ${e.toString()} ");
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    if (result == ConnectivityResult.none) {
      return updateConnectionState(result);
    } else if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      return updateConnectionState(result);
    }
  }

  Future<void> updateConnectionState(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      showStatus(result, true);
    } else {
      showStatus(result, false);
    }
  }

  void showStatus(ConnectivityResult result, bool status) {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      determineTheInternetConnection = status;
    } else {
      determineTheInternetConnection = status;
    }
  }
}
