import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/job_view_model.dart';

class JobView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: context.watch<JobViewModel>().state == JobState.BUSY
            ? buildLoadingWidget()
            : context.watch<JobViewModel>().state == JobState.ERROR
                ? buildErrorWidget()
                : buildListView(context));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Github Jobs'),
    );
  }

  Center buildErrorWidget() => Center(child: Text('Something went wrong!'));

  Center buildLoadingWidget() => Center(child: CircularProgressIndicator());

  ListView buildListView(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, index) => buildListItem(context, index));
  }

  Widget buildListItem(BuildContext context, int index) {
    final job = context.read<JobViewModel>().jobList[index];
    return Card(
      child: ListTile(
        title: Text(job.title),
      ),
    );
  }
}
