import 'package:fvm/fvm.dart';

import 'release.dto.dart';

/// Releae channel dto
class ChannelDto extends ReleaseDto {
  /// Latest releae of a channel
  Release? currentRelease;

  /// SDK Version
  final String sdkVersion;

  /// Constructor
  ChannelDto({
    required String name,
    required CacheVersion cache,
    required needSetup,
    required this.sdkVersion,
    this.currentRelease,
    Release? release,
    required isGlobal,
  }) : super(
          name: name,
          release: release,
          needSetup: needSetup,
          isChannel: true,
          cache: cache,
          isGlobal: isGlobal,
        );
}
