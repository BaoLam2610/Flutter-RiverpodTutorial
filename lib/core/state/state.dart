sealed class Resource {}

class Initialize extends Resource {}

class Loading extends Resource {}

class Success<T> extends Resource {
  final T? data;
  final String? message;

  Success({
    this.data,
    this.message,
  });
}

class Error extends Resource {
  final String message;
  Error({required this.message});
}
