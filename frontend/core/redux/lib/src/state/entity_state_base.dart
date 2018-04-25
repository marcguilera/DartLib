import 'dart:collection';

abstract class EntityStateBase <TId, TEntity> {
  final LinkedHashMap<TId, TEntity> entities = new LinkedHashMap<TId, TEntity>();
}

final entitiesSelector <TEntity>(EntityStateBase<dynamic, TEntity> state) => state.entities.entries.toList();
final idsSelector <TId> (EntityStateBase<TId, dynamic> state) => state.entities.keys.toList();