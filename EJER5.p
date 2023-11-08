{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program EJER5;

type
  TipMotor = (v8, v10, v12);
  TipCC = 800..6000;
  TipAlim = (Turbo, Atmosferico);
  TipCarr = (Coupe, Roadster);
  TippMarc = (BMW, Aston, Ferrari);
  TippAcc = (Sport, Ciudad);
  TipLis = (Listar, Motores);

  Motor = record
    tippmotor: TipMotor;
    tippalim: TipAlim;
    tippcc: TipCC;
  end;

  Acabado = record
    tippcar: TipCarr;
    tippac: TippAcc;
  end;

  Coche = record
    motorent: Motor;
    entacc: Acabado;
    marca: TippMarc;
  end;

procedure writcoh(var c: Coche);
begin
  writeln('Dime el tipo de motor: ');
  readln(c.motorent.tippmotor);
  writeln();
  writeln('Dime los CC: ');
  readln(c.motorent.tippcc);
  writeln();
  writeln('Dime la alimentacion: ');
  readln(c.motorent.tippalim);
  writeln();
  writeln('Dime el tipo de carroceria: ');
  readln(c.entacc.tippcar);
  writeln();
  writeln('Dime el acabado: ');
  readln(c.entacc.tippac);
  writeln();
  writeln('Dime la marca: ');
  readln(c.marca);
end;

procedure luffy(c1: Coche);
begin
  writeln('Motor: ', c1.motorent.tippmotor, ' ', c1.motorent.tippcc, 'cc', c1.motorent.tippalim);
  writeln('Carroceria: ', c1.entacc.tippcar, ' ', c1.entacc.tippac);
  writeln('Marca: ', c1.marca);
end;

procedure zoro(c1, c2, c3: Coche);
begin
  writeln('Motor: ', c1.motorent.tippmotor, '', c1.motorent.tippcc, 'cc', c1.motorent.tippalim);
  writeln('Carroceria: ', c1.entacc.tippcar, ' ', c1.entacc.tippac);
  writeln('Marca: ', c1.marca);
  writeln();
  writeln('Motor: ', c2.motorent.tippmotor, ' ', c2.motorent.tippcc, 'cc', c2.motorent.tippalim);
  writeln('Carroceria: ', c2.entacc.tippcar, ' ', c2.entacc.tippac);
  writeln('Marca: ', c2.marca);
  writeln();
  writeln('Motor: ', c3.motorent.tippmotor, ' ', c3.motorent.tippcc, 'cc', c3.motorent.tippalim);
  writeln('Carroceria: ', c3.entacc.tippcar, ' ', c3.entacc.tippac);
  writeln('Marca: ', c3.marca);
end;

procedure Nami(c1, c2, c3: Coche);
begin
  writeln('Motor: ', c1.motorent.tippmotor, ' ', c1.motorent.tippcc, 'cc ', c1.motorent.tippalim);
  writeln('Motor: ', c2.motorent.tippmotor, ' ', c2.motorent.tippcc, 'cc ', c2.motorent.tippalim);
  writeln('Motor: ', c3.motorent.tippmotor, ' ', c3.motorent.tippcc, 'cc ', c3.motorent.tippalim);
end;

procedure Sanji(c1, c2, c3: Coche);
begin
  writeln('Marca: ', c1.marca);
  writeln('Marca: ', c2.marca);
  writeln('Marca: ', c3.marca);
end;

function EsMasRapidoCC(c1, c2: Coche): Coche;
begin
  if c1.motorent.tippcc > c2.motorent.tippcc then
  begin
    Result := c1;
  end
  else if c1.motorent.tippcc < c2.motorent.tippcc then
  begin
    Result := c2;
  end
  else
  begin
    Result := c1;
  end;
end;

function EsMasRapidoMo(c1, c2: Coche): Coche;
begin
  if c1.motorent.tippalim < c2.motorent.tippalim then
  begin
    Result := c1;
  end
  else if c1.motorent.tippalim > c2.motorent.tippalim then
  begin
    Result := c2;
  end
  else
  begin
    Result := EsMasRapidoCC(c1, c2);
  end;
end;

function EsMasRapido(c1, c2: Coche): Coche;
begin
  if c1.marca > c2.marca then
  begin
    Result := c1;
  end
  else if c1.marca < c2.marca then
  begin
    Result := c2;
  end
  else
  begin
    Result := EsMasRapidoMo(c1, c2);
  end;
end;

procedure MasRapido(c1, c2, c3: Coche);
begin
  luffy(EsMasRapido(c3, EsMasRapido(c1, c2)));
end;

procedure imprimir(c1, c2, c3: Coche);
var
  ls: char;
begin
  writeln('Dime 1-Listar , 2-Motores , 3-Marcas, 4-Mas Rapido');
  readln(ls);
  case ls of
    '1': zoro(c1, c2, c3);
    '2': Nami(c1, c2, c3);
    '3': Sanji(c1, c2, c3);
    '4': MasRapido(c1, c2, c3);
  else
    writeln('Error');
  end;
end;

var
  c1: Coche;
  c2: Coche;
  c3: Coche;
begin
  writcoh(c1);
  writcoh(c2);
  writcoh(c3);
  imprimir(c1, c2, c3);
end.
