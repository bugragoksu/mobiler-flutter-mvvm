import 'package:flutter/foundation.dart';

import '../model/job.dart';
import '../service/web_service.dart';

enum JobState { IDLE, BUSY, ERROR }

class JobViewModel with ChangeNotifier {
  JobState _state;

  List<Job> jobList;

  JobViewModel() {
    jobList = [];
    _state = JobState.IDLE;
    fetchJobs();
  }

  JobState get state => _state;
  set state(JobState state) {
    _state = state;
    notifyListeners();
  }

  Future<List<Job>> fetchJobs() async {
    try {
      state = JobState.BUSY;
      jobList = await WebService().fetchJobs();
      state = JobState.IDLE;
      return jobList;
    } catch (e) {
      state = JobState.ERROR;
      return [];
    }
  }
}
