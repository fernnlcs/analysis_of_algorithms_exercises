class Result {
  int start, end, sum;

  Result(this.start, this.end, this.sum);
}

Result max(Result a, Result b) {
  return a.sum >= b.sum ? a : b;
}

Result maxCrossingSum(List<int> entry, int start, int middle, int end) {
  var sum = 0;
  var leftSum = -10000;
  var maxLeft = middle;

  for (var i = middle; i >= start; i--) {
    sum += entry[i];
    if (sum > leftSum) {
      leftSum = sum;
      maxLeft = i;
    }
  }

  sum = 0;
  var rightSum = -10000;
  var maxRight = middle + 1;

  for (var i = middle + 1; i <= end; i++) {
    sum += entry[i];
    if (sum > rightSum) {
      rightSum = sum;
      maxRight = i;
    }
  }

  return Result(maxLeft, maxRight, leftSum + rightSum);
}

Result maxSubArraySum<T extends Object>(List<int> entry, int start, int end) {
  if (start == end) return Result(start, end, entry[start]);

  var middle = (start + end) ~/ 2;

  return max(
      maxSubArraySum(entry, start, middle),
      max(maxSubArraySum(entry, middle + 1, end),
          maxCrossingSum(entry, start, middle, end)));
}

void main() {
  var entry = [6, -2, 11, -4, 13, -5, -2];

  var result = maxSubArraySum(entry, 1, entry[0] - 1);

  if (result.sum < 0) {
    result.sum = 0;
    result.start = -1;
    result.end = -1;
  }

  print("Soma máxima: ${result.sum}");
  print("Índice inicial: ${result.start}");
  print("Índice final: ${result.end}");
}
