import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextFieldController extends GetxController {
  late TextEditingController controller;

  AppTextFieldController({required this.controller});
}

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsecure;
  final String title;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObsecure = false,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppTextFieldController>(
      tag: GlobalKey().toString(),
      init: AppTextFieldController(controller: controller),
      initState: (_) {},
      builder: (_) {
        return Column(
          children: [
            // Title
            title == ''
                ? SizedBox()
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _.controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    )),
                obscureText: isObsecure,
              ),
            ),
          ],
        );
      },
    );
  }
}
