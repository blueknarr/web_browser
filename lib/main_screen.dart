import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'main_view_model.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final viewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    WebViewController controller = viewModel.getController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('나만의 웹브라우저'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          PopupMenuButton<String>(
              onSelected: (value) {
                controller.loadRequest(Uri.parse(value));
              },
              itemBuilder: (context) => [
                    PopupMenuItem<String>(
                        value: viewModel.googleUrl, child: const Text('구글')),
                    PopupMenuItem<String>(
                        value: viewModel.naverUrl, child: const Text('네이버')),
                    PopupMenuItem<String>(
                        value: viewModel.kakaoUrl, child: const Text('카카오')),
                  ]),
        ],
      ),
      body: WillPopScope(
          onWillPop: () async {
            if (await controller.canGoBack()) {
              await controller.goBack();
              return false;
            }
            return true;
          },
          child: WebViewWidget(controller: controller)),
    );
  }
}
