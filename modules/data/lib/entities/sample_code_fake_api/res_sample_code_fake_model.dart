import 'package:json_annotation/json_annotation.dart';

part 'res_sample_code_fake_model.g.dart';

@JsonSerializable()
class ResSampleCodeFakeModel {
  final String? id;
  final String? title;
  final String? description;
  final String? content;
  final String? url;
  final String? image;
  final String? author;
  final String? name;
  final String? slug;
  final String? memberId;
  final String? publishedAt;
  final String? createdAt;
  final String? updatedAt;

  ResSampleCodeFakeModel(this.id, this.title, this.description, this.content, this.url, this.image, this.author, this.slug,
      this.name, this.memberId, this.publishedAt, this.createdAt, this.updatedAt);

  factory ResSampleCodeFakeModel.fromJson(Map<String, dynamic> json) => _$ResSampleCodeFakeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResSampleCodeFakeModelToJson(this);
}
