import 'package:freezed_annotation/freezed_annotation.dart';

part 'extra_info.freezed.dart';
part 'extra_info.g.dart';

@freezed
class ExtraInfo with _$ExtraInfo {
  const factory ExtraInfo({
    required String name,
    required String value,
  }) = _ExtraInfo;

  factory ExtraInfo.fromJson(Map<String, dynamic> json) =>
      _$ExtraInfoFromJson(json);
} 