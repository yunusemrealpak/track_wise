import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:network/core/enums/http_types.dart';
import 'package:network/core/enums/return_types.dart';
import 'package:network/core/models/network_entity.dart';

import '../generics/network_manager.dart';

class FirebaseStoreManager implements NetworkManager {
  static final FirebaseStoreManager _instance =
      FirebaseStoreManager._internal();
  static FirebaseStoreManager get instance => _instance;
  FirebaseStoreManager._internal();

  CollectionReference<T> _getCollection<T extends NetworkEntity<T>>(
      String collectionPath, T model) {
    return FirebaseFirestore.instance
        .collection(collectionPath)
        .withConverter<T>(
          fromFirestore: (snapshot, _) {
            if (!snapshot.exists) {
              throw Exception('Document does not exist');
            }
            return model.fromJson(snapshot.data()!);
          },
          toFirestore: (model, _) => model.toJson(),
        );
  }

  @override
  Future<dynamic> send<T extends NetworkEntity<T>>(
    String path, {
    required HttpTypes type,
    required ReturnTypes returnType,
    required T parserModel,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final collection = _getCollection<T>(path, parserModel);
    switch (type) {
      case HttpTypes.GET:
        switch (returnType) {
          case ReturnTypes.single:
            if (queryParameters == null || queryParameters.containsKey('id')) {
              throw Exception('Query parameter id is required for GET request');
            }

            final id = queryParameters['id'];
            final res = await collection.doc(id).get();
            return res.data();
          case ReturnTypes.list:
            return collection
                .get()
                .then((value) => value.docs.map((e) => e.data()).toList());
          case ReturnTypes.noData:
            return null;
        }
      case HttpTypes.POST:
        if (body == null) {
          throw Exception('Body is required for POST request');
        }

        final String id = collection.doc().id;
        body['id'] = id;

        final res = await collection.add(parserModel.fromJson(body));
        final snapshot = await res.get();
        return snapshot.data();
      case HttpTypes.PUT:
        if (queryParameters == null || queryParameters.containsKey('id')) {
          throw Exception('Query parameter id is required for PUT request');
        }

        if (body == null) {
          throw Exception('Body is required for PUT request');
        }

        final id = queryParameters['id'];

        return await collection.doc(id).set(parserModel.fromJson(body));

      case HttpTypes.DELETE:
        if (queryParameters == null || queryParameters.containsKey('id')) {
          throw Exception('Query parameter id is required for PUT request');
        }

        final id = queryParameters['id'];
        return await collection.doc(id).delete();
    }
  }
}
