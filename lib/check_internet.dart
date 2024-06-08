import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gazali/web_view.dart';

class InternetConnection extends StatelessWidget {
  const InternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Color(0xfff1f5f9),
        systemNavigationBarDividerColor: Color(0xfff1f5f9),
      ),
    );
    Connectivity connectivity = Connectivity();

    return Scaffold(
      body: StreamBuilder<ConnectivityResult>(
        stream: connectivity.onConnectivityChanged,
        builder: (context, snapshot) {
          return InternetConnectionWidget(
            snapshot: snapshot,
            widget: const WebViewStack(),
          );
        },
      ),
    );
  }
}

class InternetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;
  const InternetConnectionWidget(
      {required this.snapshot, required this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return const NoInternetDialog();
          default:
            return widget;
        }
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
      // return const Center(child: Text(""));
      // return const NoInternetDialog();
    }
  }
}

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Card(
          elevation: 4,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.28,
            alignment: Alignment.center,
            // decoration: BoxDecoration(),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                Icons.wifi_off_rounded,
                size: 50,
                color: Colors.redAccent.shade200,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              const Text(
                "No Internet Connection",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text(
                    "Close App",
                    style: TextStyle(fontSize: 16),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
