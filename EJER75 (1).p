{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Ejercicio7bucles;

const
  Agua: char = '.';

type
  TBarcoTipo = (Submarino, Fragata, Portaaviones, Fin);
  TBarcoClase = Submarino..Portaaviones;
  TOrientacion = (Vertical, Horizontal);
  TFilas = 1..20;
  TColumnas = (A, B, C, D, E, F, G, H, I, J, K, L, N, M, O, P, Q, R, S, T, V, W, Z);
  TColTablero = A..J;

  TPosiciones = record
    Ejex: TColTablero;
    Ejey: TFilas;
  end;

  TBarco = record
    Tipo: TBarcoClase;
    Sentido: TOrientacion;
    Pint: char;
    pos: TPosiciones;
    Longitud: integer;
  end;

procedure DibujarCabezera();
var
  Cabezera: TColumnas;
begin
  writeln();
  write(' ');
  for Cabezera := low(TColumnas) to J do
  begin
    write(Cabezera, ' ');
  end;
  writeln();
end;

function HayBarcoHo(PosActual, InBarco, FBarco: integer):boolean;
begin
  result := (PosActual >= InBarco) and (PosActual <= FBarco);
end;

function HayBarcoVer(PosActual, InBarco, FBarco: integer): boolean;
begin
  result := (PosActual >= InBarco) and (PosActual <= FBarco);
end;

function VerHorizontal(B: TBarco; EjeYS, ejerh: integer): boolean;
begin
  result := HayBarcoHo(ejerh, ord(B.pos.Ejex) + 1, ord(B.pos.Ejex) + 1 + B.Longitud - 1) and (EjeYS = B.pos.Ejey);
end;

function VerVertical(B: TBarco; EjeYS, ejerh: integer): boolean;
begin
  result := HayBarcoVer(EjeYS, ord(B.pos.Ejey), ord(B.pos.Ejey) + B.Longitud - 1) and (ejerh = ord(B.pos.Ejex) + 1);
end;

function HayBarco(B: TBarco; EjeYS, ejerh: integer): boolean;
begin
  if B.Sentido = Vertical then
    result := VerVertical(B, EjeYS, ejerh)
  else
    result := VerHorizontal(B, EjeYS, ejerh);
end;

procedure PintarFila(B: TBarco; EjeYS: integer);
var
  EjeH: integer;
begin
  for EjeH := 1 to 10 do
  begin
    if HayBarco(B, EjeYS, EjeH) then
      write(B.Pint, ' ')
    else
      write(Agua, ' ');
  end;
end;

procedure DibujarFilas(B: TBarco);
var
  EjeYS: integer;
begin
  for EjeYS := 1 to 10 do
  begin
    write(EjeYS, ' ');
    PintarFila(B, EjeYS);
    writeln();
  end;
  writeln();
end;

procedure DibujarTablero(Brc: TBarco);
begin
  DibujarCabezera();
  DibujarFilas(Brc);
end;

procedure LeerBarcos(var B: TBarco; var Final: boolean);
var
  ls: TBarcoTipo;
begin
  writeln('Dime barco (Submarino , Fragata , Portaaviones , Fin)');
  readln(ls);
  if ls <> Fin then
  begin
    B.Tipo := ls;
    writeln('Dime columna y fila:');
    readln(B.pos.Ejex);
    readln(B.pos.Ejey);
    writeln('Dime la orientacion: ');
    readln(B.Sentido);
    writeln('Dime el caracter: ');
    readln(B.Pint);
    case B.Tipo of
      Submarino: B.Longitud := 1;
      Fragata: B.Longitud := 2;
      Portaaviones: B.Longitud := 3;
    end;
  end
  else
  begin
    Final := False;
  end;
end;

var
  Bar: TBarco;
  Final: boolean;
begin
  Final := True;
  repeat
    LeerBarcos(Bar, Final);
    if Final then
    begin
      DibujarTablero(Bar);
    end;
  until not Final;
end.
