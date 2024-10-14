program menghitunglingkaran;
//Nama : Mohammad Daffa Aditya
//NIM  : F04022038
//Kelas: B
const
  Pi = 22/7;

var
  jari_jari: real;
  luas, keliling, diameter: real;

begin
  writeln('Program untuk menghitung luas, keliling, dan diameter lingkaran.');
  writeln('-------------------------------------------------------------');
  writeln;

   // input jari-jari
  write('Masukkan jari-jari lingkaran: ');
  readln(jari_jari);

  luas := Pi * jari_jari * jari_jari;
  keliling := 2 * Pi * jari_jari;
  diameter := 2 * jari_jari;


  writeln('Luas lingkaran: ', luas:6:2);
  writeln('Keliling lingkaran: ', keliling:6:2);
  writeln('Diameter lingkaran: ', diameter:6:2);
  readln()
end.

