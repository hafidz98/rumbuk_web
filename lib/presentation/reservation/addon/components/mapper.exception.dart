class MapperException<From, To> implements Exception{
  final String message;

  MapperException(this.message);

  @override
  String toString() {
    return '[Mapper] Error when mapping class $From to $To: $message';
  }
}