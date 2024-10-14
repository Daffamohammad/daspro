program pencarian;

type
  Larik = array [1..100] of integer;

function SequentialSearch(A: Larik; N: integer; X: integer): integer;
var
  i: integer;
begin
  i := 1;
  while (i <= N) and (A[i] <> X) do
    i := i + 1;
  if (i > N) then
    SequentialSearch := 0
  else
    SequentialSearch := i;
end;

function SequentialSearch2(A: Larik; N: integer; X: integer): integer;
var
  i: integer;
begin
  i := 1;
  while (i <= N) and (A[i] < X) do
    i := i + 1;
  if (A[i] = X) then
    SequentialSearch2 := i
  else
    SequentialSearch2 := 0;
end;

function RecursiveBinarySearch(A: Larik; low, high, X: integer): integer;
var
  mid: integer;
begin
  if low > high then
    RecursiveBinarySearch := 0
  else
  begin
    mid := (low + high) div 2;
    if A[mid] = X then
      RecursiveBinarySearch := mid
    else if A[mid] > X then
      RecursiveBinarySearch := RecursiveBinarySearch(A, low, mid - 1, X)
    else
      RecursiveBinarySearch := RecursiveBinarySearch(A, mid + 1, high, X);
  end;
end;

var
  A: Larik;
  i, n, x: integer;
begin
  n := 10;
  x := 500;
  for i := 1 to n do
    A[i] := i * 100;
  writeln('Sequential Search: ', SequentialSearch(A, n, x));
  writeln('Sequential Search 2: ', SequentialSearch2(A, n, x));
  writeln('Recursive Binary Search: ', RecursiveBinarySearch(A, 1, n, x));
  readln;
end.

