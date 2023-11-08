{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Ejer4;


function nnumero(Numero: Integer): Boolean;
begin
  Result := (Numero >= 0) and (Numero <= 5000);
end;

function lletra(letra: Char): Boolean;
begin
  Result := (Ord('A') <= Ord(letra)) and (Ord(letra) <= Ord('Z'));
end;

function appt(apto: char): Boolean;
begin
  if (apto = 'a') or  (apto = 'A') then
    Result := True
  else begin
    Result := False;
  end;
end;

function resultnota(nota : real; apto : char ) : Real;
begin
  if appt(apto) then 
    result := ((10 + nota ) / 2)
  else 
    result := ((0 + nota) / 2);
end;

procedure LeerAlumno(var letra : char; var numero : Integer);
begin
  WriteLn('Letra del NIF:');
  ReadLn(letra);
  WriteLn('Numero de NIF:');
  ReadLn(numero);
  if nnumero(numero) and lletra(letra) then begin
  end
  else begin
    WriteLn('Alumno erroneo');
    Halt
  end;
  
end;
procedure LeerNota( var nota : real; var apto : char );
begin
  writeln('Apto o no apto(A o N)');
  readln(apto);
  writeln('Dime la nota: ');
  readln(nota);

  if appt(apto) then
   begin
      writeln('Tu nota final es A ', resultnota(nota, apto));
    end
  else
    begin
      writeln('Tu nota final es B ', resultnota(nota, apto));
    end;
end;


procedure LeerAlumno2(var letra : char; var numero : Integer);
begin
  WriteLn('Letra del NIF del segundo alumno:');
  ReadLn(letra);
  WriteLn('Numero de NIF del segundo alumno:');
  ReadLn(numero);
  if nnumero(numero) and lletra(letra) then begin
  end
  else begin
    WriteLn('Alumno erroneo');
    Halt
  end;
  
end;
procedure LeerNota2( var nota : real; var apto : char );
begin
  writeln('Apto o no apto(A o N)');
  readln(apto);
  writeln('Dime la nota: ');
  readln(nota);
  
  if appt(apto) then
   begin
      writeln('Tu nota final es A ', resultnota(nota, apto));
    end
  else
    begin
      writeln('Tu nota final es B ', resultnota(nota, apto));
    end;
end;

procedure LeerAlumno3(var letra : char; var numero : Integer);
begin
  WriteLn('Letra del NIF del tercer alumno:');
  ReadLn(letra);
  WriteLn('Numero de NIF del tercer alumno:');
  ReadLn(numero);
  if nnumero(numero) and lletra(letra) then begin
  end
  else begin
    WriteLn('Alumno erroneo');
    Halt
  end;
  
end;
procedure LeerNota3( var nota : real; var apto : char );
begin
  writeln('Apto o no apto(A o N)');
  readln(apto);
  writeln('Dime la nota: ');
  readln(nota);
  
  if appt(apto) then
   begin
      writeln('Tu nota final es A ', resultnota(nota, apto));
    end
  else
    begin
      writeln('Tu nota final es B ', resultnota(nota, apto));
    end;
end;

var
  letra: Char;
  numero: Integer;
  apto : Char;
  nota : real; 
begin
  LeerAlumno(letra,numero); 
  LeerNota(nota,apto);
  LeerAlumno2(letra,numero);
  LeerNota2(nota,apto);
  LeerAlumno3(letra,numero);
  LeerNota3(nota,apto)
end.
