class DataorErrorResponse<T> {
  final String? error;
  final T? data;

  DataorErrorResponse({
    this.error,
    this.data,
  });
}
