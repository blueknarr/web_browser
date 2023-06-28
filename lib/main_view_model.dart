import 'dart:ui';

import 'package:webview_flutter/webview_flutter.dart';

class MainViewModel {
  final _naverUrl = 'https://www.naver.com';
  final _googleUrl = 'https://www.google.com';
  final _kakaoUrl = 'https://www.kakao.com';
  final _youtubeUrl = 'https://www.youtube.com';
  final _flutterUrl = 'https://flutter.dev';

  String get naverUrl => _naverUrl;
  String get googleUrl => _googleUrl;
  String get kakaoUrl => _kakaoUrl;

  WebViewController getController() {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(_youtubeUrl)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(_flutterUrl));
  }
}
