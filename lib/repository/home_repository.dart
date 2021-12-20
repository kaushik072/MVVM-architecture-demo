import 'package:test_project/helper/helper.dart';
import 'package:test_project/models/models.dart';
import 'package:dio/dio.dart';

class HomeRepository {

  /*
  * This function call problems api for home page
  * will return list of problems if data get successfully other wise it will send null
  * */
  Future<List<ProblemsModel>?> getProblems() async {
    List<ProblemsModel> problems;

    try {
      Response response = await Dio().get(Urls.problems);
      if (response.statusCode == 200) {
        problems = [];
        final data = response.data;
        data['problems'].forEach((e) {
          problems.add(ProblemsModel.fromJson(e));
        });
        return problems;
      }
    } catch (e) {
      return null;
    }
  }
}
