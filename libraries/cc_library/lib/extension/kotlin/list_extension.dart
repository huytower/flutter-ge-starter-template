import 'dart:math';

/// extension for list any.
extension ListTypeExtension<T> on List<T> {
  List<T> forEachIndexed(Function(T e, int index) result) {
    var index = 0;
    for (var element in this) {
      result(element, index);
      index = index + 1;
    }
    return this;
  }

  List<List<T>> chunked(int chunkSize) {
    var number = (length / chunkSize).round();
    var lists = List.generate(
      number,
      (i) => sublist(chunkSize * i, (i + 1) * chunkSize <= length ? (i + 1) * chunkSize : length),
    );
    return lists;
  }

  T? getOrNull(int index) {
    if (index <= length) {
      return asMap()[index];
    }
    return null;
  }

  bool isValidAt(int index) {
    if ((index >= 0) && (index < length)) {
      return true;
    }
    return false;
  }

  T getRandomElement() {
    final random = Random();
    var i = random.nextInt(length);
    return this[i];
  }

  T? firstOrNull({Function<bool>(T element)? condition}) {
    if (condition == null) {
      if (length >= 0) {
        return first;
      }
      return null;
    } else {
      return firstWhere((element) => condition(element));
    }
  }

  T? getIndexOrNull(int index) {
    if ((index >= 0) && (index < length)) {
      return this[index];
    }
    return null;
  }

  T? lastOrNull({Function<bool>(T element)? condition}) {
    if (condition == null) {
      if (length >= 0) {
        return last;
      }
      return null;
    } else {
      return lastWhere((element) => condition(element));
    }
  }
}
