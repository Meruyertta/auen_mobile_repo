import 'package:logger/logger.dart';

final logger = Logger(
  printer: HybridPrinter(
    _OneLinePrettyPrinter(),
    error: PrettyPrinter(colors: false),
  ),
);

class _OneLinePrettyPrinter extends PrettyPrinter {
  static final _levelEmojis = {
    Level.verbose: '⚪️ ',
    Level.debug: '🟤 ',
    Level.info: '🟢 ',
    Level.warning: '🟠 ',
    Level.error: '🔴 ',
    Level.wtf: '🟣 ',
  };

  _OneLinePrettyPrinter() : super(stackTraceBeginIndex: 1);

  @override
  List<String> log(LogEvent event) {
    final messageStr = stringifyMessage(event.message);

    final line = event.stackTrace == null
        ? formatStackTrace(StackTrace.current, 1)
        : null;
    final stackTraceStr =
        event.stackTrace != null ? formatStackTrace(event.stackTrace, 8) : null;

    final errorStr = event.error?.toString();

    final time = DateTime.now();
    final timeStr = _getTime(time);

    return [
      '${_labelFor(event.level)} $timeStr | $messageStr ${line != null ? ' | $line' : ''}',
      if (errorStr != null) errorStr,
      if (stackTraceStr != null) stackTraceStr,
    ];
  }

  String _labelFor(Level level) => _levelEmojis[level]!;

  String _getTime(DateTime now) {
    final h = _twoDigits(now.hour);
    final min = _twoDigits(now.minute);
    final sec = _twoDigits(now.second);
    final ms = _threeDigits(now.millisecond);
    return '$h:$min:$sec.$ms';
  }

  String _threeDigits(int n) => n.toString().padLeft(3, '0');

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
