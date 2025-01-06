extension StringNullSafety on String? {
  String orEmpty() => this ?? "";
}

extension IntNullSafety on int? {
  int orZero() => this ?? 0;
}

extension NullSafety<T> on T? {
  T orDefault(T replacementValue) => this ?? replacementValue;
}

extension ListExtend<T, K> on List<T> {
  List<T> distinct() => toSet().toList();
  List<T> distinctBy(K Function(T) selector) {
    final tempSet = <K>{};
    final distictedList = List<T>.empty(growable: true);
    for (var data in this) {
      final key = selector(data);
      if (tempSet.add(key)) distictedList.add(data);
    }
    return distictedList;
  }
}
