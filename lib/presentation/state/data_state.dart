enum DataState {
  initial,
  loading,
  success,
  error;

  bool get isSuccess => this == success;
}
