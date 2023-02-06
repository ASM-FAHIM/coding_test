import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/module/controller/test_controller.dart';
import 'package:task_app/utils/colors.dart';
import 'package:task_app/widget/big_text.dart';
import 'package:get/get.dart';

import '../../widget/small_text.dart';


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
              Expanded(
                child: Obx(() {
                  if (testController.isLoading.value) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(color: AppColor.loadingColor,),
                          ),
                          Text('Loading...'),
                        ],
                      ),
                    );
                  }
                  else {
                    return ListView.builder(
                        itemCount: testController.test!.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 345,
                              width: 370,
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: AppColor.containerColor
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      BigText(text: '${testController.test!.data[index].caption}'),
                                      BigText(text: '${testController.test!.data[index].id}'),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  SmallText(text: DateFormat.jm().format(DateTime.parse(testController.test!.data[index].createdAt.toString())), color: Colors.black,),
                                  SizedBox(height: 10,),
                                  Container(
                                    height: 268,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: AppColor.loadingColor
                                    ),
                                  ),
                                  //SmallText(text: '${testController.test!.data[index].videoUrl}',),
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
