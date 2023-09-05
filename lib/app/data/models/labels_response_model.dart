import 'dart:convert';

List<LabelsResponseModel> labelsResponseModelFromJson(String str) => List<LabelsResponseModel>.from(json.decode(str).map((x) => LabelsResponseModel.fromJson(x)));

String labelsResponseModelToJson(List<LabelsResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabelsResponseModel {
  int? id;
  String? nodeId;
  String? url;
  String? name;
  String? color;
  bool? labelsResponseModelDefault;
  String? description;

  LabelsResponseModel({
    this.id,
    this.nodeId,
    this.url,
    this.name,
    this.color,
    this.labelsResponseModelDefault,
    this.description,
  });

  factory LabelsResponseModel.fromJson(Map<String, dynamic> json) => LabelsResponseModel(
    id: json['id'],
    nodeId: json['node_id'],
    url: json['url'],
    name: json['name'],
    color: json['color'],
    labelsResponseModelDefault: json['default'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'node_id': nodeId,
    'url': url,
    'name': name,
    'color': color,
    'default': labelsResponseModelDefault,
    'description': description,
  };
}
