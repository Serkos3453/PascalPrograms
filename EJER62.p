{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program EJER6;

const
  Papel: char = ' ';

type 
  figuras = (Triangulo , Cuadrado , Trianguloizq , Triangulodrch, Rectangulo , FIN);

procedure escrn(car: char; n: integer);
var
  i: integer;
begin
  for i := 1 to n do
  begin
    write(car);
  end;
end;

procedure escua(n1: char; n2, fila: integer);
begin
  escrn(Papel, n2 - fila); 
  escrn(n1, 2 * fila - 1); 
  writeln();
end;

procedure cuadra(n1 : char; n2 , fila : integer);
begin
  escrn(n1, n2);
  WriteLn();
end;
 
procedure triang(n1 : char; n2 , fila :integer);
begin
  escrn(n1 , fila);
  writeln();
end;

procedure triangizq(n1 : char; n2 , fila : integer);
begin
  escrn(papel ,n2 - fila);
  escrn(n1 , fila );
  writeln();
end;

procedure rectan(n1 : char; ancho , alto  : integer);
begin
  escrn(n1, ancho);
  WriteLn();
end;

procedure esrectg(ancho, alto: Integer);
var
  fila: Integer;
  n1: Char;
begin
  WriteLn('Dime el caracter: ');
  ReadLn(n1);

  WriteLn('rectangulo ', n1,' ', ancho, ' ', alto);
  for fila := 1 to alto do
  begin
    rectan(n1, ancho, fila);
  end;
end;


procedure estriang(alto : integer);
var 
  fila : integer;
  n1: char;
begin
  writeln('Dime el caracter: ');
  ReadLn(n1);

  writeln('triangulo ', n1 , alto );
  for fila := 1 to alto do
  begin
    triang(n1, alto, fila);
  end;
end;

procedure cuad(alto : integer);
var 
  fila : integer;
  n1: char;
begin
  writeln('Dime el caracter: ');
  ReadLn(n1);
  for fila := 1 to alto do
  begin
    cuadra(n1, alto, fila);
  end;
end;

procedure escrtriangulosim(alto: integer);
var
  fila: integer;
  n1: char;
begin
  writeln('Dime el caracter : ');
  readln(n1);
  for fila := 1 to alto do
  begin
    escua(n1, alto, fila);
  end;
end;

procedure estriangizq(alto : integer);
var 
  fila : integer;
  n1: char;
begin
  writeln('Dime el caracter: ');
  ReadLn(n1);
  for fila := 1 to alto do
  begin
    triangizq(n1, alto, fila);
  end;
end;

procedure esrecang(var n2 , fila : Integer);
var
alto : Integer;
ancho : Integer;
begin
  n2 := n2+1;
  WriteLn('Dime el tamaño: ');
  ReadLn(alto);
  ReadLn(ancho);
  esrectg(alto,ancho);
  fila := fila + alto;
end;

procedure escr(var n2 , fila : integer);
var
alto:integer;
begin
  n2:=n2+1;  
  writeln('Dime el tamaño: ');
  readln(alto);
  escrtriangulosim(alto);
  fila := fila + alto;
end;

procedure escrcuadra(var n2 , fila : integer);
var 
alto : integer; 
begin
  n2 := n2 +1; 
  writeln('Dime el tamaño: ');
  readln(alto);
  cuad(alto);
  fila := fila + alto;
end;

procedure escrtrian(var juju , fila : integer);
var 
alto : integer;
begin
  juju := juju +1;
  writeln('Dime el tamaño: ');
  readln(alto);
  estriang(alto);
  fila := fila + alto;
end;

procedure escrtrianqizq(var n2 , fila : integer);
var 
alto : integer;
begin
  n2 := n2 + 1;
  writeln('Dime el tamaño: ');
  readln(alto );
  estriangizq(alto);
  fila := fila + alto; 
end;

procedure contarfig (figuras , ancho : integer );
begin
  writeln ( 'El programa tiene ', figuras ,' figuras  y ', ancho,' lineas ');
  writeln ('FIN');
end;

procedure buclefig(var n2 , fila : integer);
var
  ls: figuras;
begin 
  repeat
  writeln('Dime Triangulo , Trianguloizq , Triangulodrch, Cuadrado , Rectangulo , FIN');
  readln(ls);
  case ls of
    Triangulo : escr( n2 , fila);
    Trianguloizq : escrtrianqizq(  n2 , fila);
    Triangulodrch : escrtrian(  n2 , fila);
    Cuadrado : escrcuadra( n2 , fila);
    Rectangulo : esrecang(n2 , fila);
    FIN : contarfig ( n2 , fila);
  else
    writeln();
  end;
  until ls = FIN;
end;

var 
n2 : integer;
fila: Integer;
begin
  n2 := 0;
  fila := 0;
  buclefig( n2 , fila);
end.



