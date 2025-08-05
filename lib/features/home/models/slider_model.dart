import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_model.freezed.dart';
part 'slider_model.g.dart';

@freezed
class SliderModel with _$SliderModel {
  const factory SliderModel({
    required String name,
    required String imageUrl,
  }) = _SliderModel;

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
}
