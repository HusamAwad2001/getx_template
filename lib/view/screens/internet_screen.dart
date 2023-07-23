import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/internet_controller.dart';
import '../../core/global.dart';
import '../widgets/spinner_widget.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: GetBuilder<InternetController>(
            init: InternetController(),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    color: const Color(0xFF01367C),
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "قد لا يتوفر الإنترنت",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.loading
                      ? const IconButton(
                          onPressed: null,
                          icon: SpinnerWidget(
                            color: Colors.blue,
                          ),
                          color: Colors.blue,
                          iconSize: 50,
                        )
                      : IconButton(
                          onPressed: () async {
                            controller.loading = true;
                            controller.update();
                            await Future.delayed(1.seconds);
                            try {
                              final result =
                                  await InternetAddress.lookup('google.com');
                              if (result.isNotEmpty &&
                                  result[0].rawAddress.isNotEmpty) {
                                Get.offAllNamed(
                                  Global.token == ""
                                      ? Routes.loginPage
                                      : Routes.homePage,
                                );
                              }
                            } on SocketException catch (_) {
                              controller.loading = false;
                              controller.update();
                            }
                          },
                          icon: const Icon(Icons.refresh),
                          color: Colors.blue,
                          iconSize: 50,
                        ),
                  const SizedBox(height: 100),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
