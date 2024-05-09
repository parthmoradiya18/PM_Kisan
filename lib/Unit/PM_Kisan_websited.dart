import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PM_KISAN_web extends StatefulWidget {
  const PM_KISAN_web({Key? key}) : super(key: key);

  @override
  State<PM_KISAN_web> createState() => _PM_KISAN_webState();
}

class _PM_KISAN_webState extends State<PM_KISAN_web> {
  String? Url;
  double Progress = 0;
  InAppWebViewController? webViewController;
  String? current;
  bool ForWord = false;
  bool Back = false;
  PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Url = ModalRoute.of(context)!.settings.arguments as String?;
    return WillPopScope(
      onWillPop: () async {
        await webViewController!.goBack();
        return (current == Url) ? true : false;
      },
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.lightGreen.shade700,
              title: const Text(
                "PM KISAN SAMMAN NIDHI",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/");
                },
                icon: const Icon(
                  size: 20,
                  Icons.arrow_back_outlined,
                ),
              ),
              actions: [
                (Back)
                    ? IconButton(
                        onPressed: () async {
                          if (webViewController != null) {
                            await webViewController!.goBack();
                          }
                          setState(() {});
                        },
                        icon: const Icon(
                          size: 20,
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
                IconButton(
                  onPressed: () async {
                    if (webViewController != null) {
                      await webViewController!.reload();
                    }
                    setState(() {});
                  },
                  icon: const Icon(
                    size: 20,
                    CupertinoIcons.refresh,
                  ),
                ),
                (ForWord)
                    ? IconButton(
                        onPressed: () async {
                          if (webViewController != null) {
                            await webViewController!.goForward();
                          }
                        },
                        icon: const Icon(
                          size: 20,
                          CupertinoIcons.arrow_right,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              ],
            ),
            preferredSize: Size(0, 45)),
        body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: Progress,
                backgroundColor: Colors.red.shade900,
              ),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse(Url!),
                  ),
                  pullToRefreshController: pullToRefreshController,
                  onWebViewCreated: (controller) {
                    setState(() {
                      webViewController = controller;
                    });
                  },
                  onLoadStart: (controller, url) async {
                    setState(() {
                      current = url.toString();
                    });
                    ForWord = await webViewController!.canGoForward();
                    Back = await webViewController!.canGoBack();
                    setState(() {});
                  },
                  onLoadStop: (controller, url) async {
                    setState(() {
                      current = url.toString();
                    });
                    ForWord = await webViewController!.canGoForward();
                    Back = await webViewController!.canGoBack();
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
