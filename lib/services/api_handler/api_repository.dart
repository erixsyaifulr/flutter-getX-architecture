import 'package:my_architecture/services/api_handler/api_extension.dart';
import 'package:my_architecture/services/api_handler/api_handler.dart';

import '../../constants/endpoints.dart';

class ApiRepository {
  final ApiBaseHelper apiBaseHelper;
  ApiRepository(this.apiBaseHelper);

  Future getTopHeadLines(paramMap) async {
    return await apiBaseHelper
        .getWithParam(EndPoints.topHeadLine, paramMap)
        .execute((data) => data);
  }
}
