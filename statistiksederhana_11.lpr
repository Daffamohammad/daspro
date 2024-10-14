program statistiksederhana_11;

var
  Data: array[1..100] of integer;
  Count: integer;

procedure InputData(var Data: array of integer; var Count: integer);
var
  i: integer;
begin
  Count := 0;
  writeln('Masukkan jumlah data: ');
  readln(Count);
  writeln('Masukkan data:');
  readln;
  for i := 1 to Count do
  begin
    readln(Data[i]);
  end;
end;

procedure TampilkanData(Data: array of integer; Count: integer);
var
  i: integer;
begin
  writeln('Data yang dimasukkan:');
  for i := 1 to Count do
  begin
    write(Data[i], ' ');
  end;
  writeln;
end;

function Terkecil(Data: array of integer; Count: integer): integer;
var
  i, Min: integer;
begin
  Min := Data[1];
  for i := 2 to Count do
  begin
    if Data[i] < Min then
      Min := Data[i];
  end;
  Terkecil := Min;
end;

function Terbesar(Data: array of integer; Count: integer): integer;
var
  i, Max: integer;
begin
  Max := Data[1];
  for i := 2 to Count do
  begin
    if Data[i] > Max then
      Max := Data[i];
  end;
  Terbesar := Max;
end;

function RataRata(Data: array of integer; Count: integer): real;
var
  i: integer;
  Total: integer;
begin
  Total := 0;
  for i := 1 to Count do
  begin
    Total := Total + Data[i];
  end;
  RataRata := Total / Count;
end;

var
  Pilihan: integer;
  BilanganTerkecil, BilanganTerbesar: integer;
  Rata: real;

begin
  Count := 0;
  repeat
    writeln;
    writeln('Menu:');
    writeln('1. Input Data');
    writeln('2. Tampilkan Data');
    writeln('3. Tampilkan Bilangan Terkecil');
    writeln('4. Tampilkan Bilangan Terbesar');
    writeln('5. Tampilkan Rata-rata');
    writeln('0. Keluar');
    writeln;
    write('Pilih: ');
    readln(Pilihan);

    case Pilihan of
      1:
      begin
        InputData(Data, Count);
      end;
      2:
      begin
        TampilkanData(Data, Count);
      end;
      3:
      begin
        if Count > 0 then
        begin
          BilanganTerkecil := Terkecil(Data, Count);
          writeln('Bilangan Terkecil: ', BilanganTerkecil);
        end
        else
          writeln('Belum ada data yang dimasukkan.');
      end;
      4:
      begin
        if Count > 0 then
        begin
          BilanganTerbesar := Terbesar(Data, Count);
          writeln('Bilangan Terbesar: ', BilanganTerbesar);
        end
        else
          writeln('Belum ada data yang dimasukkan.');
      end;
      5:
      begin
        if Count > 0 then
        begin
          Rata := RataRata(Data, Count);
          writeln('Rata-rata: ', Rata:0:2);
        end
        else
          writeln('Belum ada data yang dimasukkan.');
      end;
      0:
      begin
        writeln('Terima kasih!');
        readln;
        writeln('Tekan "ENTER" untuk keluar program.');
        readln;
      end;
    else
      writeln('Pilihan tidak valid!');
      readln;
    end;

  until Pilihan = 0;
end.

