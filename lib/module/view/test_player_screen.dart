import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/module/controller/test_controller.dart';
import 'package:task_app/utils/colors.dart';
import 'package:task_app/utils/dimensions.dart';
import 'package:task_app/widget/big_text.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
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
                              height: Dimensions.height345,
                              width: Dimensions.width370,
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
                                  SizedBox(height: Dimensions.height10,),
                                  SmallText(text: DateFormat.jm().format(DateTime.parse(testController.test!.data[index].createdAt.toString())), color: Colors.black,),
                                  SizedBox(height: Dimensions.height10,),
                                  Container(
                                    height: Dimensions.height268,
                                    width: Dimensions.width350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.transparent
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Chewie(
                                      controller: ChewieController(
                                        videoPlayerController: VideoPlayerController.network(testController.test!.data[index].videoUrl),
                                        autoInitialize: true,
                                        autoPlay: false,
                                        looping: false,
                                        aspectRatio: 10.6/9,
                                      ),
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

