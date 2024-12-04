import 'package:bets/initial.dart';
import 'package:bets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexController>(
        builder: (_, provider, ___) {
          return Center(
            child: provider.hasInternetConnection
                ? (provider.isLoading)
                    ? Logo(controller: provider)
                    : HomeScreen(url: provider.url)
                : const NoInternet(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String? url;

  const HomeScreen({
    super.key,
    required this.url,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late InAppWebViewController _webViewController;

  Future<bool> onBackPressed() async {
    _webViewController.goBack();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: onBackPressed,
          child: widget.url != null
              ? Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          InAppWebView(
                            initialUrlRequest: URLRequest(
                              url: Uri.parse(widget.url!),
                            ),
                            initialOptions: InAppWebViewGroupOptions(
                              crossPlatform: InAppWebViewOptions(
                                useShouldOverrideUrlLoading: true,
                                javaScriptCanOpenWindowsAutomatically: true,
                              ),
                            ),
                            onWebViewCreated: (controller) {
                              _webViewController = controller;
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Initial(),
        ),
      ),
    );
  }
}

class Logo extends StatefulWidget {
  final IndexController controller;

  const Logo({super.key, required this.controller});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    widget.controller.configureUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        SizedBox(
          width: 150,
          height: 150,
          child: Image.asset('assets/logo.png'),
        ),
        const Spacer(),
        const Text(
          'Loading data..',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16.0),
        LoadingAnimationWidget.bouncingBall(
          color: Colors.black,
          size: 50,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IndexController>(
      builder: (_, provider, ___) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Image.asset('assets/no_internet.jpg'),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'For further correct performance of the application, please turn on the Internet',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () => provider.configureUrl(),
                child: const Text('Reload'),
              ),
            ],
          ),
        );
      },
    );
  }
}
