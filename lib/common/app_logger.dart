import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    lineLength: 140,
  ),
);

final Logger simpleLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 140,
  ),
);
