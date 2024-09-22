/// extension for Scope function and inspired kotlin .
///
/// Example [apply]_________________________________________________________________
///
///   Test(value_1: "value_1", value_2: "value_2").apply((_this) {
///      _this.value_1 = "change_value_1";
///   });
///
/// Example [takeIf]_________________________________________________________________
///     var list = [0, 1, 2, 3];
///
///     list.takeIf((_it) => list.length <= 2)?.apply((_this) {
///       "_this :.. ${_this.length} ".Log();
///     });
///
///
///
///
extension ScopeTypeExtension<T> on T {
  T apply(Function(T _this) block) {
    block(this);
    return this;
  }

  T? takeIf(bool Function(T _it) predicate) {
    if (predicate(this)) {
      return this;
    } else {
      return null;
    }
  }
}
