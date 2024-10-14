program entridatamahasiswa;

uses crt;

const
  MaxData = 30;

type
  Mahasiswa = record
    nama: string[20];
    nilaiAlpro: integer;
  end;

var
  data: array[1..MaxData] of Mahasiswa;
  banyakData: integer;
  namaDicari: string[20];
  nilaiDitemukan: integer;

procedure InputData;
var
  i: integer;
begin
  WriteLn('Masukkan jumlah data (Maksimal ', MaxData, '): ');
  ReadLn(banyakData);
  if (banyakData > MaxData) then
  begin
    WriteLn('Melebihi batas data!');
    banyakData := MaxData;
  end;
  For i := 1 To banyakData Do Begin
    Write('Masukkan nama mahasiswa ke-', i, ': ');
    ReadLn(data[i].nama);
    Write('Masukkan nilai Alpro mahasiswa ke-', i, ': ');
    ReadLn(data[i].nilaiAlpro);
  End;
end;

procedure TampilkanData;
var
  i: integer;
begin
  If banyakData = 0 Then
    WriteLn('Data mahasiswa masih kosong!')
  Else
    For i := 1 To banyakData Do Begin
      WriteLn(data[i].nama, ': ', data[i].nilaiAlpro);
    End;
end;

function NilaiAlproTerbesar: integer;
var
  i: integer;
  nilaiTerbesar: integer;
begin
  nilaiTerbesar := data[1].nilaiAlpro;
  For i := 2 To banyakData Do
    If data[i].nilaiAlpro > nilaiTerbesar Then
      nilaiTerbesar := data[i].nilaiAlpro;
  NilaiAlproTerbesar := nilaiTerbesar;
end;

function NilaiAlproTerkecil: integer;
var
  i: integer;
  nilaiTerkecil: integer;
begin
  nilaiTerkecil := data[1].nilaiAlpro;
  For i := 2 To banyakData Do
    If data[i].nilaiAlpro < nilaiTerkecil Then
      nilaiTerkecil := data[i].nilaiAlpro;
  NilaiAlproTerkecil := nilaiTerkecil;
end;

function RataRataNilaiAlpro: real;
var
  i: integer;
  jumlahNilai: integer;
begin
  jumlahNilai := 0;
  For i := 1 To banyakData Do
    jumlahNilai := jumlahNilai + data[i].nilaiAlpro;
  RataRataNilaiAlpro := jumlahNilai / banyakData;
end;

function PencarianBinerRekursif(low, high: integer; namaDicari: string): integer;
var
  mid: integer;
begin
  if low > high then
    PencarianBinerRekursif := -1
  else
  begin
    mid := (low + high) div 2;
    if data[mid].nama = namaDicari then
      PencarianBinerRekursif := data[mid].nilaiAlpro
    else if data[mid].nama < namaDicari then
      PencarianBinerRekursif := PencarianBinerRekursif(mid + 1, high, namaDicari)
    else
      PencarianBinerRekursif := PencarianBinerRekursif(low, mid - 1, namaDicari);
  end;
end;

procedure CariNilaiMahasiswa;
begin
  Write('Masukkan nama mahasiswa: ');
  ReadLn(namaDicari);
  nilaiDitemukan := PencarianBinerRekursif(1, banyakData, namaDicari);
  If nilaiDitemukan <> -1 Then
    WriteLn('Data Ditemukan! Nilai Alpro ', namaDicari, ' = ', nilaiDitemukan)
  Else
    WriteLn('Data Tidak Ditemukan!');
end;

procedure MenuUtama;
var
  pilihan: integer;
begin
  Repeat
    WriteLn;
    WriteLn('Selamat Datang di Program Entri Mahasiswa');
    WriteLn('1. Input Data');
    WriteLn('2. Tampilkan Data');
    WriteLn('3. Nilai Alpro Terbesar');
    WriteLn('4. Nilai Alpro Terkecil');
    WriteLn('5. Rata-rata Nilai Alpro');
    WriteLn('6. Cari Nilai Mahasiswa');
    WriteLn('7. Keluar');
    Write('Pilihan Anda (1-7): ');
    ReadLn(pilihan);
    case pilihan of
      1: InputData;
      2: TampilkanData;
      3: WriteLn('Nilai Alpro Terbesar: ', NilaiAlproTerbesar);
      4: WriteLn('Nilai Alpro Terkecil: ', NilaiAlproTerkecil);
      5: WriteLn('Rata-rata Nilai Alpro: ', RataRataNilaiAlpro:0:2);
      6: CariNilaiMahasiswa;
      7: WriteLn('Terima kasih telah menggunakan program ini!');
    else
      WriteLn('Pilihan tidak valid. Silakan coba lagi.');
    end;
  until pilihan = 7;
end;

begin
  banyakData := 0;
  MenuUtama;
end.
