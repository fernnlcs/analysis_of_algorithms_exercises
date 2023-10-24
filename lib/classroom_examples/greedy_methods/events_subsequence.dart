void main(List<String> args) {
  const sequence = ['CD', 'VD', 'CH', 'VH', 'CD'];
  const subsequence = ['CD', 'CD', 'CD'];

  var result = isSubsequence(sequence, subsequence);

  print(result);
}

bool isSubsequence(List<String> sequence, List<String> subsequence) {
  if (subsequence.length > sequence.length) {
    return false;
  }
  var subsequenceIndex = 0;
  for (var event in sequence) {
    if (event == subsequence[subsequenceIndex]) {
      subsequenceIndex++;
    }
  }
  return subsequenceIndex == subsequence.length;
}
