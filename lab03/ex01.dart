/**
 * Task: Implement a RingBuffer with a fixed capacity (push(), pop(), peakEnd(), peakStart()) isEmpty(), toString())
 * 
 * FIFO implementation that overwrites the oldest data.
 */

class RingBuffer<T> {
  final List<T?> _buffer;
  final int _length;

  int _beginIndex = 0;
  int _endIndex = 0;
  bool _empty = true;

  RingBuffer(this._length) : _buffer = List<T?>.filled(_length, null);

  RingBuffer<T> push(T value) {
    _buffer[_endIndex] = value;

    if (!isEmpty() && _endIndex == _beginIndex) {
      _beginIndex = (_beginIndex + 1) % _length;
    }

    _endIndex = (_endIndex + 1) % _length;
    _empty = false;

    return this;
  }

  T? pop() {
    if (isEmpty()) {
      throw Exception('The ring buffer is empty.');
    }

    final value = _buffer[_beginIndex];
    _buffer[_beginIndex] = null;

    _beginIndex = (_beginIndex + 1) % _length;
    if (_beginIndex == _endIndex) {
      _empty = true;
    }

    return value;
  }

  T? peekEnd() {
    if (isEmpty()) {
      return null;
    }

    final index = (_endIndex - 1 + _length) % _length;
    return _buffer[index];
  }

  T? peekStart() {
    if (isEmpty()) {
      return null;
    }

    return _buffer[_beginIndex];
  }

  bool isEmpty() => _empty;

  @override
  String toString() {
    if (isEmpty()) return '[]';

    List<T> result = [];
    int i = _beginIndex;

    while (true) {
      final val = _buffer[i];
      if (val != null) result.add(val);

      if (i == (_endIndex - 1 + _length) % _length) break;

      i = (i + 1) % _length;
    }

    return result.toString();
  }
}

void main() {
  final ringBuffer = RingBuffer<int>(5);

  ringBuffer.push(1).push(2).push(3).push(4).push(5);
  ringBuffer.push(6);

  print(ringBuffer);

  print(ringBuffer.pop()); // 2
  print(ringBuffer.peekStart()); // 3
  print(ringBuffer.peekEnd()); // 6
}
