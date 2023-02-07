import 'package:get/get.dart';
import 'package:task_app/module/model/test_model.dart';
import 'package:http/http.dart' as http;

class TestController extends GetxController {
  RxBool isLoading = false.obs;
  TestModel? test;


  @override
  void onInit() {
    fetchTestApi();
    super.onInit();
  }

  Future<void> fetchTestApi() async{
    try{
      isLoading(true);
      var responseTest = await http.get(Uri.parse('https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test'));
      if(responseTest.statusCode == 200){
        test = testModelFromJson(responseTest.body);
        print('Test api values are: ${responseTest.body}');
        print('Test api values are: ${test!.data.length}');
        isLoading(false);
      }else{
        print('Error occurred: ${responseTest.statusCode}');
        isLoading(false);
      }
    }catch(error){
      print('There is an error occurred: $error');
      isLoading(false);
    }
  }
}
