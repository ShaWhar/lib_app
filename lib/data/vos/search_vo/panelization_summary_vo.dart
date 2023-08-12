


import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'panelization_summary_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForPanelizationSummaryVO)
class PanelizationSummary {
  @HiveField(0)
  @JsonKey(name: 'containsEpubBubbles')
  bool? containsEpubBubbles;

  @HiveField(1)
  @JsonKey(name: 'containsImageBubbles')
  bool? containsImageBubbles;

  PanelizationSummary({this.containsEpubBubbles, this.containsImageBubbles});

  @override
  String toString() {
    return '{containsEpubBubbles: $containsEpubBubbles, containsImageBubbles: $containsImageBubbles}';
  }

}