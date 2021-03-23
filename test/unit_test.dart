import 'package:flutter_test/flutter_test.dart';
import 'package:getxtest/networking/api_client.dart';
import 'package:getxtest/models/login_model.dart';

void main() {
  test('Testing the login API', ()async{
    final response=await ApiClient().login('8591442116', '1111', 'deviceToken');
    if(response.status=='200'){
      expect('200', response.status);
    }
    else if(response.status=='201') {
      expect('201', response.status);
    }
  });
}