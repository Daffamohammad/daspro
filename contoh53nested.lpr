program contoh53nested;
Var
   Nilai: integer;
Begin
   Writeln('Input nilai yang Anda dapatkan 0.s.d. 100');
   Write('Nilai Anda=');
   readln(Nilai);

   Case nilai of
    0..59 : writeln('Anda tidak lulus');
    60..100:
      begin
        write('Anda lulus');
        case nilai of
         60..74: writeln('dengan nilai cukup');
         75..89: writeln('dengan nilai sangat baik');

        end;
      end;
    else writeln('Anda salah input nilai');
      end;
   readln;
   end.
