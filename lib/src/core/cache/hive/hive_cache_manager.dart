import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../cache_manager.dart';

@Injectable(as: CacheManager)
final class HiveCacheManager<T> implements CacheManager<T> {
  final String boxName;
  Box<T>? _box;

  HiveCacheManager(this.boxName);

  Future<Box<T>> _openBox() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox<T>(boxName);
    }
    return _box!;
  }

  @override
  Future<void> addItem(T item) async {
    final box = await _openBox();
    await box.add(item);
  }

  @override
  Future<void> addItems(List<T> items) async {
    final box = await _openBox();
    await box.addAll(items);
  }

  @override
  Future<List<T>> getItems() async {
    final box = await _openBox();
    return box.values.toList();
  }

  @override
  Future<void> clear() async {
    final box = await _openBox();
    await box.clear();
  }
}
