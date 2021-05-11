// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'dart:convert';

List<Job> jobFromJson(String str) =>
    List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  Job({
    this.id,
    this.type,
    this.url,
    this.createdAt,
    this.company,
    this.companyUrl,
    this.location,
    this.title,
    this.description,
    this.howToApply,
    this.companyLogo,
  });

  String id;
  String type;
  String url;
  String createdAt;
  String company;
  String companyUrl;
  String location;
  String title;
  String description;
  String howToApply;
  String companyLogo;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        type: json["type"],
        url: json["url"],
        createdAt: json["created_at"],
        company: json["company"],
        companyUrl: json["company_url"] == null ? null : json["company_url"],
        location: json["location"],
        title: json["title"],
        description: json["description"],
        howToApply: json["how_to_apply"],
        companyLogo: json["company_logo"] == null ? null : json["company_logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "url": url,
        "created_at": createdAt,
        "company": company,
        "company_url": companyUrl == null ? null : companyUrl,
        "location": location,
        "title": title,
        "description": description,
        "how_to_apply": howToApply,
        "company_logo": companyLogo == null ? null : companyLogo,
      };
}
