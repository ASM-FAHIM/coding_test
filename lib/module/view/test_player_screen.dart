import 'package:flutter/material.dart';
import 'package:task_app/module/controller/test_controller.dart';
import 'package:task_app/utils/colors.dart';
import 'package:task_app/widget/big_text.dart';
import 'package:get/get.dart';


class TestPlayerScreen extends StatefulWidget {
  const TestPlayerScreen({Key? key}) : super(key: key);

  @override
  State<TestPlayerScreen> createState() => _TestPlayerScreenState();
}

class _TestPlayerScreenState extends State<TestPlayerScreen> {
  TestController testController = Get.put(TestController());


  @override
  void initState() {
    // TODO: implement initState
    testController.fetchTestApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 40,
          leading: const CircleAvatar(
            backgroundColor: AppColor.circleColor,
            child: Icon(Icons.camera_alt_rounded, size: 20, color: AppColor.iconColor,),
          ),
          title: BigText(text: 'Explore',),
          actions: const [
            CircleAvatar(
              backgroundColor: AppColor.circleColor,
              child: Icon(Icons.notification_add_sharp, size: 20, color: AppColor.iconColor,),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
            ],
          ),
        ),
      ),
    );
  }
}
