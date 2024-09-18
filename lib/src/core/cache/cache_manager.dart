abstract class CacheManager<T> {
  Future<void> addItem(T item);
  Future<void> addItems(List<T> items);
  Future<List<T>> getItems();
  Future<void> clear();
}
