program mencaristandardeviasi;


var
  data: array of Real;
  rata, sd: Real;
  n, i: integer;
  sum, sumSquares: Real;

begin
  Writeln('Mencari Standar Deviasi (SD)');
  Writeln('============================');
  Writeln('');

  // Input jumlah data
  Write('Masukkan jumlah data: ');
  Readln(n);

  // Inisiasi array data
  SetLength(data, n);

  // Input data and calculate sum
  sum := 0;
  for i := 0 to n - 1 do
  begin
    Write('Masukkan data ke-', i + 1, ': ');
    Readln(data[i]);
    sum := sum + data[i];
  end;

  // Input rata-rata (mean)
  Write('Masukkan rata: ');
  Readln(rata);

  // Hitung jumlah kuadrat selisih dengan rata-rata
  sumSquares := 0;
  for i := 0 to n - 1 do
  begin
    sumSquares := sumSquares + Sqr(data[i] - rata);
  end;

  // Hitung standar deviasi
  sd := Sqrt(sumSquares / (n - 1));

  // Output hasil
  Writeln('Standar Deviasi(SD) = ', sd:0:2);
  Readln();
end.

