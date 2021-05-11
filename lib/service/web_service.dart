import 'package:http/http.dart' as http;

import '../constant/application_constants.dart';
import '../model/job.dart';

class WebService {
  Future<List<Job>> fetchJobs() async {
    final response = await http.get(Uri.parse(ApplicationConstants.API_URL));
    if (response.statusCode == 200) {
      return jobFromJson(response.body);
    }
    return [];
  }
}
