import 'package:flutter_riverpod/legacy.dart';

final dateProvider = StateProvider.autoDispose<DateTime>((ref) => DateTime.now());
