import 'dart:convert';

import 'package:jellyflut/models/jellyfin/codec_profile.dart';
import 'package:jellyflut/models/jellyfin/condition.dart';
import 'package:jellyflut/models/jellyfin/device_profile.dart';
import 'package:jellyflut/models/jellyfin/direct_play_profile.dart';
import 'package:jellyflut/models/jellyfin/response_profile.dart';
import 'package:jellyflut/models/jellyfin/subtitle_profile.dart';
import 'package:jellyflut/models/jellyfin/transcoding_profile.dart';

class PlayersProfile {
  late final List<PlayerProfile> playersProfile;

  PlayersProfile() {
    final vlcComputer = PlayerProfile(
        name: PlayerProfileName.VLC_COMPUTER.value,
        deviceProfile: DeviceProfile(
            name: PlayerProfileName.VLC_COMPUTER.value,
            maxStreamingBitrate: 120000000,
            maxStaticBitrate: 100000000,
            musicStreamingTranscodingBitrate: 384000,
            transcodingProfiles: [
              TranscodingProfile(
                  container: 'ts',
                  audioCodec: 'aac',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'hls',
                  maxAudioChannels: '6',
                  minSegments: 1,
                  breakOnNonKeyFrames: true),
              TranscodingProfile(
                  container: 'aac',
                  audioCodec: 'aac',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'mp3',
                  audioCodec: 'mp3',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'opus',
                  audioCodec: 'opus',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'wav',
                  audioCodec: 'wav',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'opus',
                  audioCodec: 'opus',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'mp3',
                  audioCodec: 'mp3',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'aac',
                  audioCodec: 'aac',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'wav',
                  audioCodec: 'wav',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'ts',
                  audioCodec: 'aac,mp3,opus',
                  videoCodec: 'h264,hevc',
                  context: 'Streaming',
                  protocol: 'hls',
                  maxAudioChannels: '6',
                  type: 'Video',
                  minSegments: 1,
                  breakOnNonKeyFrames: true),
              TranscodingProfile(
                  container: 'webm',
                  type: 'Video',
                  audioCodec: 'vorbis,opus',
                  videoCodec: 'vp8,vp9,av1,vpx',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'mp4',
                  audioCodec: 'aac,mp3,opus,flac,vorbis',
                  videoCodec: 'h264',
                  context: 'Static',
                  protocol: 'http')
            ],
            codecProfiles: [
              CodecProfile(
                  type: 'VideoAudio',
                  container: 'avi,mkv,mp4,webm,mov',
                  codec: 'aac,mp2,mp3,ac3,eac3,dts,opus,flac,vorbis',
                  conditions: []),
            ],
            containerProfiles: [],
            directPlayProfiles: [
              DirectPlayProfile(
                  container: 'webm,mp4,m4v,mov,mkv,avi,mpegts',
                  type: 'Video',
                  videoCodec: 'h264,hevc,vp8,vp9,av1,mpeg4',
                  audioCodec: 'aac,mp2,mp3,ac3,eac3,dts,opus,flac,vorbis'),
              DirectPlayProfile(
                  container: 'webm,m4a,m4b,webm,mpegts',
                  audioCodec: 'aac,mp2,mp3,ac3,eac3,dts,opus,flac,vorbis',
                  type: 'Audio'),
              DirectPlayProfile(container: 'mp3', type: 'Audio'),
              DirectPlayProfile(container: 'aac', type: 'Audio'),
              DirectPlayProfile(container: 'm4a', type: 'Audio'),
              DirectPlayProfile(container: 'flac', type: 'Audio'),
              DirectPlayProfile(container: 'webma', type: 'Audio'),
              DirectPlayProfile(container: 'wav', type: 'Audio'),
              DirectPlayProfile(container: 'ogg', type: 'Audio')
            ],
            subtitleProfiles: [
              SubtitleProfile(format: 'dvdsub', method: 'External'),
              SubtitleProfile(format: 'srt', method: 'External'),
              SubtitleProfile(format: 'vtt', method: 'External'),
              SubtitleProfile(format: 'subrip', method: 'External'),
              SubtitleProfile(format: 'sub', method: 'External'),
              SubtitleProfile(format: 'smi', method: 'External'),
              SubtitleProfile(format: 'pgsub', method: 'External'),
              SubtitleProfile(format: 'pgs', method: 'External'),
              SubtitleProfile(format: 'idx', method: 'External'),
              SubtitleProfile(format: 'ass', method: 'External'),
              SubtitleProfile(format: 'ssa', method: 'External')
            ],
            responseProfiles: []));
    final vlcPhone = PlayerProfile(
        name: PlayerProfileName.VLC_PHONE.value,
        deviceProfile: DeviceProfile(
            name: PlayerProfileName.VLC_PHONE.value,
            maxStreamingBitrate: 120000000,
            maxStaticBitrate: 100000000,
            musicStreamingTranscodingBitrate: 384000,
            transcodingProfiles: [
              TranscodingProfile(
                  container: 'ts',
                  audioCodec: 'aac',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'hls',
                  maxAudioChannels: '6',
                  minSegments: 1,
                  breakOnNonKeyFrames: true),
              TranscodingProfile(
                  container: 'aac',
                  audioCodec: 'aac',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'mp3',
                  audioCodec: 'mp3',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'opus',
                  audioCodec: 'opus',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'wav',
                  audioCodec: 'wav',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'opus',
                  audioCodec: 'opus',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'mp3',
                  audioCodec: 'mp3',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'aac',
                  audioCodec: 'aac',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'wav',
                  audioCodec: 'wav',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'ts',
                  audioCodec: 'aac,mp3',
                  videoCodec: 'h264',
                  context: 'Streaming',
                  protocol: 'hls',
                  maxAudioChannels: '6',
                  type: 'Video',
                  minSegments: 1,
                  breakOnNonKeyFrames: true),
              TranscodingProfile(
                  container: 'webm',
                  type: 'Video',
                  audioCodec: 'vorbis,opus',
                  videoCodec: 'vp8,vp9,av1,vpx',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'mp4',
                  audioCodec: 'aac,mp3,opus,flac,vorbis',
                  videoCodec: 'h264',
                  context: 'Static',
                  protocol: 'http')
            ],
            codecProfiles: [
              CodecProfile(
                  type: 'VideoAudio',
                  container: 'avi,mkv,mp4,webm,mov',
                  codec: 'aac,mp3,ac3,dts,opus,flac,vorbis',
                  conditions: [
                    Condition(
                        condition: 'Equals',
                        property: 'IsSecondaryAudio',
                        value: 'false',
                        isRequired: false)
                  ]),
              CodecProfile(type: 'VideoAudio', conditions: [
                Condition(
                    condition: 'Equals',
                    property: 'IsSecondaryAudio',
                    value: 'false',
                    isRequired: false)
              ]),
              CodecProfile(
                  type: 'Video',
                  codec: 'hevc,h264',
                  container: 'avi,mkv,mp4,webm',
                  conditions: [
                    Condition(
                        condition: 'NotEquals',
                        property: 'IsAnamorphic',
                        value: 'true',
                        isRequired: false),
                    Condition(
                        condition: 'EqualsAny',
                        property: 'VideoProfile',
                        value:
                            'high|main|main 10|baseline|constrained baseline|high 10',
                        isRequired: false),
                    Condition(
                        condition: 'NotEquals',
                        property: 'IsInterlaced',
                        value: 'true',
                        isRequired: false)
                  ]),
            ],
            containerProfiles: [],
            directPlayProfiles: [
              DirectPlayProfile(
                  container: 'webm',
                  type: 'Video',
                  videoCodec: 'vp8,vp9,av1',
                  audioCodec: 'vorbis,opus'),
              DirectPlayProfile(
                  container: 'mp4,m4v,mov',
                  type: 'Video',
                  videoCodec: 'h264,hevc,vp8,vp9,av1',
                  audioCodec: 'aac,mp2,mp3,ac3,eac3,opus,flac,vorbis'),
              DirectPlayProfile(
                  container: 'mkv,avi',
                  type: 'Video',
                  videoCodec: 'h264,hevc',
                  audioCodec: 'aac,mp2,mp3,ac3,eac3,opus,flac,vorbis'),
              DirectPlayProfile(
                  container: 'webm', audioCodec: 'opus', type: 'Audio'),
              DirectPlayProfile(
                  container: 'm4a', audioCodec: 'aac', type: 'Audio'),
              DirectPlayProfile(
                  container: 'm4b', audioCodec: 'aac', type: 'Audio'),
              DirectPlayProfile(
                  container: 'webm', audioCodec: 'webma', type: 'Audio'),
              DirectPlayProfile(container: 'mp3', type: 'Audio'),
              DirectPlayProfile(container: 'aac', type: 'Audio'),
              DirectPlayProfile(container: 'm4a', type: 'Audio'),
              DirectPlayProfile(container: 'flac', type: 'Audio'),
              DirectPlayProfile(container: 'webma', type: 'Audio'),
              DirectPlayProfile(container: 'wav', type: 'Audio'),
              DirectPlayProfile(container: 'ogg', type: 'Audio')
            ],
            subtitleProfiles: [
              SubtitleProfile(format: 'dvdsub', method: 'External'),
              SubtitleProfile(format: 'srt', method: 'External'),
              SubtitleProfile(format: 'vtt', method: 'External'),
              SubtitleProfile(format: 'subrip', method: 'External'),
              SubtitleProfile(format: 'sub', method: 'External'),
              SubtitleProfile(format: 'smi', method: 'External'),
              SubtitleProfile(format: 'pgsub', method: 'External'),
              SubtitleProfile(format: 'pgs', method: 'External'),
              SubtitleProfile(format: 'idx', method: 'External'),
              SubtitleProfile(format: 'ass', method: 'External'),
              SubtitleProfile(format: 'ssa', method: 'External')
            ],
            responseProfiles: [
              ResponseProfile(
                  type: 'Video', container: 'm4v', mimeType: 'video/mp4')
            ]));
    final webOs = PlayerProfile(
        name: PlayerProfileName.WEB_OS.value,
        deviceProfile: DeviceProfile(
            name: PlayerProfileName.WEB_OS.value,
            maxStreamingBitrate: 120000000,
            maxStaticBitrate: 100000000,
            musicStreamingTranscodingBitrate: 384000,
            transcodingProfiles: [
              TranscodingProfile(
                  container: 'aac',
                  audioCodec: 'aac',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'mp3',
                  audioCodec: 'mp3',
                  type: 'Audio',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'opus',
                  audioCodec: 'opus',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'mp3',
                  audioCodec: 'mp3',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'aac',
                  audioCodec: 'aac',
                  type: 'Audio',
                  context: 'Static',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'webm',
                  type: 'Video',
                  audioCodec: 'mp3,ogg,aac',
                  videoCodec: 'vp8,vp9,av1,h264',
                  context: 'Streaming',
                  protocol: 'http',
                  maxAudioChannels: '6'),
              TranscodingProfile(
                  container: 'mp4',
                  audioCodec: 'aac,mp3,opus,flac,vorbis',
                  videoCodec: 'h264',
                  context: 'Static',
                  protocol: 'http')
            ],
            codecProfiles: [
              CodecProfile(
                  type: 'VideoAudio',
                  container: 'webm,mpeg,mp4',
                  codec: 'aac,mp2,mp3,aac',
                  conditions: []),
            ],
            containerProfiles: [],
            directPlayProfiles: [
              DirectPlayProfile(
                  container: 'webm,mpeg,mp4',
                  type: 'Video',
                  videoCodec: 'h264,vp8,vp9,av1',
                  audioCodec: 'ogg,mp2,mp3,ac3'),
              DirectPlayProfile(container: 'mp3', type: 'Audio'),
              DirectPlayProfile(container: 'aac', type: 'Audio'),
              DirectPlayProfile(container: 'm4a', type: 'Audio')
            ],
            subtitleProfiles: [
              SubtitleProfile(format: 'vtt', method: 'External')
            ],
            responseProfiles: []));

    playersProfile = <PlayerProfile>[];
    playersProfile.add(vlcComputer);
    playersProfile.add(vlcPhone);
    playersProfile.add(webOs);
  }

  PlayerProfile? getByName(PlayerProfileName name) {
    return playersProfile.firstWhere((profile) => profile.name == name.value);
  }
}

class PlayerProfile {
  final String name;
  final DeviceProfile deviceProfile;

  const PlayerProfile({
    required this.name,
    required this.deviceProfile,
  });

  PlayerProfile copyWith({
    String? name,
    DeviceProfile? deviceProfile,
  }) {
    return PlayerProfile(
      name: name ?? this.name,
      deviceProfile: deviceProfile ?? this.deviceProfile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'deviceProfile': deviceProfile.toMap(),
    };
  }

  factory PlayerProfile.fromMap(Map<String, dynamic> map) {
    return PlayerProfile(
      name: map['name'] ?? '',
      deviceProfile: DeviceProfile.fromMap(map['deviceProfile']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerProfile.fromJson(String source) =>
      PlayerProfile.fromMap(json.decode(source));

  @override
  String toString() =>
      'PlayerProfile(name: $name, deviceProfile: $deviceProfile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlayerProfile &&
        other.name == name &&
        other.deviceProfile == deviceProfile;
  }

  @override
  int get hashCode => name.hashCode ^ deviceProfile.hashCode;
}

enum PlayerProfileName {
  WEB_OS('WebOs'),
  VLC_COMPUTER('VlcComputer'),
  VLC_PHONE('VlcPhone');

  final String value;

  const PlayerProfileName(this.value);
}
