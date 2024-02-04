{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program ejercicio7bucles;

const
  agua: char = '.';

type
  tbarcotipo = (submarino, fragata, portaaviones, fin);
  tbarcoclase = submarino..portaaviones;
  torientacion = (vertical, horizontal);
  tfilas = 1..20;
  tcolumnas = (a, b, c, d, e, f, g, h, i, j, k, l, n, m, o, p, q, r, s, t, v, w, z);
  tcoltablero = a..j;

  tposiciones = record
    ejex: tcoltablero;
    ejey: tfilas;
  end;

  tbarco = record
    tipo: tbarcoclase;
    sentido: torientacion;
    pint: char;
    pos: tposiciones;
    longitud: integer;
  end;

  tipoflota = array[0..10] of tbarco;

  tipobgui = record
    flotas:  tipoflota;
    numbarc: integer;
  end;

procedure dibujarcabezera();
var
  cabezera: tcolumnas;
begin
  writeln();
  write(' ');
  for cabezera := low(tcolumnas) to j do
  begin
    write(cabezera, ' ');
  end;
  writeln();
end;

function haybarcoho(posactual, inbarco, fbarco: integer):boolean;
begin
  result := (posactual >= inbarco) and (posactual <= fbarco);
end;

function haybarcover(posactual, inbarco, fbarco: integer): boolean;
begin
  result := (posactual >= inbarco) and (posactual <= fbarco);
end;

function verhorizontal(b: tbarco; ejeyS, ejerh: integer): boolean;
begin
  result := haybarcoho(ejerh, ord(b.pos.ejex) + 1, ord(b.pos.ejex) + 1 + b.longitud - 1) and (ejeyS = b.pos.ejey);
end;

function ververtical(b: tbarco; ejeyS, ejerh: integer): boolean;
begin
  result := haybarcover(ejeyS, ord(b.pos.ejey), ord(b.pos.ejey) + b.longitud - 1) and (ejerh = ord(b.pos.ejex) + 1);
end;

function haybarco(b: tbarco; ejeyS, ejerh: integer): boolean;
begin
  if b.sentido = vertical then
    result := ververtical(b, ejeyS, ejerh)
  else
    result := verhorizontal(b, ejeyS, ejerh);
end;

procedure pintarfila(b: tipobgui; ejeyS: integer);
var
  ejerh: integer;
  haybarcoenposicion: boolean;
  numBgui:integer;
begin
  for ejerh := 1 to 10 do
  begin
    haybarcoenposicion := false; 
    for numBgui := 0 to b.numbarc do
    begin
      if haybarco(b.flotas[numBgui], ejeyS, ejerh) then
      begin
        write(b.flotas[numBgui].pint, ' ');
        haybarcoenposicion := true; 
      end;
    end;
    if not haybarcoenposicion then
      write(agua, ' ');
  end; 
end;


procedure dibujarfilas(b: tipobgui);
var
  ejeyS: integer;
begin
  for ejeyS := 1 to 10 do
  begin
    write(ejeyS, ' ');
    pintarfila(b, ejeyS);
    writeln();
  end;
  writeln();
end;

procedure dibujartablero(brc: tipobgui);
begin
  dibujarcabezera();
  dibujarfilas(brc);
end;

procedure leerbarcos(var b: tbarco; var final: boolean);
var
  ls: tbarcotipo;
begin
  writeln('dime barco (submarino , fragata , portaaviones , fin)');
  readln(ls);
  if ls <> fin then
  begin
    b.tipo := ls;
    writeln('dime columna y fila:');
    readln(b.pos.ejex);
    readln(b.pos.ejey);
    writeln('dime la orientacion: ');
    readln(b.sentido);
    writeln('dime el caracter: ');
    readln(b.pint);
    case b.tipo of
      submarino: b.longitud := 1;
      fragata: b.longitud := 2;
      portaaviones: b.longitud := 3;
    end;
  end
  else
  begin
    final := false;
  end;
end; 

function barcomasgrande(barca: tipobgui): tbarco;
var 
  i: integer;
  masgrande: tbarco;
begin
  masgrande.longitud := 0; 
  for i := 0 to barca.numbarc do
  begin
    if barca.flotas[i].longitud > masgrande.longitud then
      masgrande := barca.flotas[i]; 
  end;
  result := masgrande; 
end;

procedure imprimirbarcomasgrande(flota: tipobgui);
var
  barcomgrande: tbarco;
begin
  barcomgrande := barcomasgrande(flota);
  
  writeln('el barco más grande es:');
  writeln('tipo: ', barcomgrande.tipo);
  writeln('longitud: ', barcomgrande.longitud);
  writeln('orientación: ', barcomgrande.sentido);
  writeln('posición x: ', barcomgrande.pos.ejex);
  writeln('posición y: ', barcomgrande.pos.ejey);
  writeln('carácter: ', barcomgrande.pint);
end;

var
  final: boolean;
  flota : tipobgui;
begin
  final := true;
  flota.numbarc := 0; 
  repeat
    leerbarcos(flota.flotas[flota.numbarc], final);
    if final then
    begin
      dibujartablero(flota);
    end;
    flota.numbarc := flota.numbarc+1;
  until not final;
  imprimirbarcomasgrande(flota);
end.
