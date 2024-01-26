

import 'package:case_study/models/user_pagination_model.dart';
import 'package:http/http.dart';

class UserService {


  Future<UserPaginationModel> getUserWithPagination(int page) async {
    try {
    //  var headers = _apiService.getHeaders();

        final response = await get(
      Uri.parse('https://reqres.in/api/users?page=$page'),
  
    );

      if (response.statusCode == 200) {
      UserPaginationModel userPaginationModel =
            UserPaginationModel.fromRawJson(response.body);

        return userPaginationModel;
      
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
