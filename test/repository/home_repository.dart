
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:test_project/models/home_page_model/problems_model.dart';
import '../../lib/repository/repository.dart';

void main() {
  /**
   * Write this test case to test get problems api
   */
  group('Get Problem API Response Test', () {

    test('Repository > Home Repository', () async {
      WidgetsFlutterBinding.ensureInitialized();
      HomeRepository homeRepository = HomeRepository();
      List<ProblemsModel>? problemList = await homeRepository.getProblems();
      print(problemList);
      expect((problemList?.length??0)>0, true);
    });


  });
}