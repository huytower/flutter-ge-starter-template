import 'dart:math' as math;

extension IterableExtension on Iterable<int> {
  int get getMax => reduce(math.max);

  int get getMin => reduce(math.min);
}
