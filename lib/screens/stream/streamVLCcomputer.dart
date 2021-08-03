import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jellyflut/main.dart';
import 'package:jellyflut/provider/streamModel.dart';
import 'package:jellyflut/shared/theme.dart';

class StreamVLCComputer extends StatefulWidget {
  final Player player;
  final Media media;
  final int playerId;
  final bool showControls;

  StreamVLCComputer(
      {Key? key,
      this.showControls = true,
      required this.playerId,
      required this.media,
      required this.player})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _StreamVLCComputerState();
}

class _StreamVLCComputerState extends State<StreamVLCComputer>
    with AutomaticKeepAliveClientMixin {
  late StreamModel streamModel;

  //
  final double initSnapshotRightPosition = 10;
  final double initSnapshotBottomPosition = 10;

  // slider
  double sliderValue = 0.0;
  double volumeValue = 50;
  String position = '';
  String duration = '';
  int numberOfCaptions = 0;
  int numberOfAudioTracks = 0;

  //
  List<double> playbackSpeeds = [0.5, 1.0, 2.0];
  int playbackSpeedIndex = 1;
  final Orientation currentOrientation =
      MediaQuery.of(navigatorKey.currentContext!).orientation;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // Wakelock.enable();
    streamModel = StreamModel();
    // _controller = widget.player;
    // TODO add listener
    // _startProgressTimer();
    // Hide device overlays
    // device orientation
    widget.player.open(
      widget.media,
      autoStart: true, // default
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    if (currentOrientation == Orientation.portrait) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
    super.initState();
  }

  @override
  void dispose() {
    // Wakelock.disable();
    // _controller.removeListener(listener);
    // _timer.cancel();
    // Show device overlays
    // device orientation
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: SystemUiOverlay.values);
    if (currentOrientation == Orientation.portrait) {
      SystemChrome.setPreferredOrientations([]);
    }
    super.dispose();
  }

  /*
  void listener() async {
    if (!mounted) return;
    if (_controller.value.isInitialized) {
      var oPosition = _controller.value.position;
      var oDuration = _controller.value.duration;
      if (oDuration.inHours == 0) {
        var strPosition = oPosition.toString().split('.')[0];
        var strDuration = oDuration.toString().split('.')[0];
        position = "${strPosition.split(':')[1]}:${strPosition.split(':')[2]}";
        duration = "${strDuration.split(':')[1]}:${strDuration.split(':')[2]}";
      } else {
        position = oPosition.toString().split('.')[0];
        duration = oDuration.toString().split('.')[0];
      }
      sliderValue = _controller.value.position.inSeconds.toDouble();
      numberOfCaptions = _controller.value.spuTracksCount;
      numberOfAudioTracks = _controller.value.audioTracksCount;
      setState(() {});
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            child: Container(
                color: Colors.black,
                child: Video(
                  playerId: widget.playerId,
                  height: size.height,
                  width: size.width,
                  scale: 1.0, // default
                  showControls: true,
                )))
      ],
    ));
  }

  Widget gradientMask({required Widget child}) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: 0.5,
          colors: <Color>[jellyLightBLue, jellyLightPurple],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }

  /*
  void _startProgressTimer() {
    _timer = Timer.periodic(
        Duration(seconds: 15),
        (Timer t) => itemProgress(streamModel.item!,
            canSeek: true,
            isMuted: _controller.currentController. .volume > 0 ? true : false,
            isPaused: !_controller.value.isPlaying,
            positionTicks: _controller.value.position.inMicroseconds,
            volumeLevel: _controller.value.volume.round(),
            subtitlesIndex: 0));
  }
  */
}