program PembelianTiketKonser;

var
  row: char;
  seat: integer;
  hargaNormal, hargaDiskon, totalBayar, diskonjurusan, diskonmember: real;
  memberType: string;
  Bisdig: string;
  i, j: integer;

begin
  // Input data
  write('Masukkan row tempat duduk (A-G): ');
  readln(row);
  write('Masukkan nomor tempat duduk (1-10): ');
  readln(seat);
  write('Apakah Anda mahasiswa fakultas ekonomi jurusan bisnis digital? (ya/tidak): ');
  readln(Bisdig);
  write('Apakah Anda fans member? (gold/silver/none): ');
  readln(memberType);

  // harga tiket normal berdasarkan row
  case row of
    'A': hargaNormal := 1000000;
    'B': hargaNormal := 500000;
    'C': hargaNormal := 350000;
    'D': hargaNormal := 250000;
    'E': hargaNormal := 150000;
    'F': hargaNormal := 100000;
    'G': hargaNormal := 50000;
  else
    begin
      writeln('Row tempat duduk tidak valid.');
      halt;
    end;
  end;

  // Menghitung diskon berdasarkan status mahasiswa
  if Bisdig = 'ya' then
    diskonjurusan := hargaNormal * 0.02 // diskon 2% untuk mahasiswa bisnis digital
  else
  begin
  if bisdig = 'tidak' then
    diskonjurusan := hargaNormal * 0.01; // diskon 1% untuk mahasiswa selain bisnis digital
     end;
   // Menghitung tambahan diskon berdasarkan status member
  if memberType = 'gold' then
    diskonmember := diskonjurusan + (hargaNormal * 0.025) // tambahan diskon 2.5% untuk member gold
  else
  begin
    if memberType = 'silver' then
      diskonmember := diskonjurusan + (hargaNormal * 0.01) // tambahan diskon 1% untuk member silver
    else
      diskonmember := diskonjurusan; // Tidak ada tambahan diskon untuk non-member
  end;


  // Menghitung total harga tiket setelah diskon
  hargaDiskon := hargaNormal - diskonmember;

  // Menampilkan total bayar
  totalBayar := hargaDiskon;

    // Menampilkan struk pembelian tiket
  writeln('No tempat duduk: ', row, seat);
  writeln('Harga: Rp ', hargaNormal:0:2);
 writeln('Diskon: ', ((hargaNormal - hargaDiskon) / hargaNormal) * 100:0:2, '% sebesar: Rp ', diskonmember:0:2);
  writeln('Total Bayar: Rp ', totalBayar:0:2);


  // Menampilkan posisi tempat duduk dengan simbol
  writeln('Posisi tempat duduk anda');
  writeln(' Panggung');
  writeln(' * * * * * * * * * *');
  writeln('  1 2 3 4 5 6 7 8 9 10');

  for i := 1 to 7 do
  begin
    write(chr(64 + i), ' ');
    for j := 1 to 10 do
    begin
      if (chr(64 + i) = row) and (j = seat) then
        write('# ')
      else
        write('_ ');
    end;
    writeln;
  end;

  // Menampilkan terima kasih
  writeln('@@@@@@@@@');
  writeln(' Terima kasih');
  writeln('@@@@@@@@@');
  readln;
end.

