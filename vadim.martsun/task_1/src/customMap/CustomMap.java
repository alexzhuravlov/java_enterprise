package customMap;

public interface CustomMap<K,V> {
    V put(K key, V value);
    V get(K key);
}
