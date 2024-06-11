import 'package:gazali/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({super.key});

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  WebViewController _controller = WebViewController();
  

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AppProvider>(context, listen: false);

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          provider.setLoadingPercentage(0);
          provider.setLoading(true);
        },
        onProgress: (progress) {
          provider.setLoadingPercentage(progress);
        },
        onPageFinished: (url) {
          provider.setLoadingPercentage(100);
          provider.setLoading(false);
        },
      ))
      ..loadRequest(
        // Uri.parse('https://softdigit.in/track-soft/'),
        // Uri.parse('https://www.smokeandvapedistributor.ca/'),
        Uri.parse('https://qatar.gazaliperfume.com/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xffc07d77), // Transparent status bar
      statusBarBrightness: Brightness.dark, // Dark text for status bar
      systemNavigationBarColor: Color(0xffc07d77),
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return SafeArea(
      
      child: Consumer<AppProvider>(builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: provider.isLoading
              ? Container(
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Group25.png'),fit: BoxFit.fill)),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SpinKitPouringHourGlassRefined(
                      //   color: Color(0xffffd700),
                      //   size: 50,
                      // ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.50,
                      ),
                      Image.asset("assets/images/1.gif",height: 40,),
                      // SizedBox(
                      //   height: MediaQuery.sizeOf(context).height * 0.02,
                      // ),
                      // Text("Loading... ${provider.loadingPercentage}%")
                    ],
                  ))
              // ignore: deprecated_member_use
              : WillPopScope(
                  onWillPop: () async {
                    if (await _controller.canGoBack()) {
                      await _controller.goBack();
                    } else {
                      SystemNavigator.pop();
                    }
                    return false;
                  },
                  child: WebViewWidget(
                    controller: _controller,
                  ),
                ),
        );
      }),
    );
  }
}
