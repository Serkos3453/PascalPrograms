{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
program playbingo;

const 
    MaxCart = 100;
    MaxString = 255; 
    tab: string = '	';
    maxExtracc = 401;
type
    TipoNum = 1..101;
    TipoColor = (Rojo, Azul, Amarillo, Verde);
    
    TipoLinea = record
        color: TipoColor;
        nums: array[1..5] of TipoNum;
        nnumeros: integer;
    end;

    TipoCarton = record
        lineas: array[1..3] of TipoLinea;
        nlineas: integer;
    end;

    TipoPlayer = record
        cartones: array[1..MaxCart] of TipoCarton;
        ncartones: integer;
    end;
    
    TipoStr = record
        cars: array[1..MaxString] of char;
        ncars: integer;
    end;

procedure fatal(msg: string);
begin
	writeln('error fatal: ', msg);
	halt(1);
end;

procedure vaciarstr(var str: TipoStr);
begin
	str.ncars := 0;
end;

procedure appcar(var str: TipoStr; c: char);
begin
	if str.ncars = MaxString then begin
		fatal('appcar: demasiados');
	end;
	str.ncars := str.ncars + 1;
	str.cars[str.ncars] := c;
end;

function esblanco(c: char): boolean;
begin
	result := (c = ' ') or (c = Tab);
end;

procedure leerstr(var entrada: Text; var str: TipoStr);
var
	c: char;
	haypalabra: boolean;
begin
	vaciarstr(str);
	haypalabra := false;
	while not eof(entrada) and not haypalabra do begin
		if eoln(entrada) then begin
			readln(entrada);
		end
		else begin
			read(entrada, c);
			haypalabra := not esblanco(c);
		end;
	end;
	while haypalabra do begin
		appcar(str, c);
		if eof(entrada) or eoln(entrada) then begin
			haypalabra := false;
		end
		else begin
			read(entrada, c);
			haypalabra := not esblanco(c);
		end;
	end;
end;

procedure escrstr(str: TipoStr);
var
	i: integer;
begin
	for i := 1 to str.ncars do begin
		write(str.cars[i]);
	end;
end;

procedure escrstrln(str: TipoStr);
begin
	escrstr(str);
	writeln();
end;

function strtostring(str: TipoStr): string;
var
	i: integer;
	s: string;
begin
	setlength(s, str.ncars);
	for i := 1 to str.ncars do begin
		s[i] := str.cars[i];
	end;
	result := s;
end;

procedure leerstring(var entrada: text; var s: string);
	var str: TipoStr;
begin
	leerstr(entrada, str);
	s := strtostring(str);
end;

procedure leerint(var entrada: text; var n: integer; var ok: boolean);
var
	s: string;
	pos: integer;
begin
	ok := not eof();
	if ok then begin
		leerstring(entrada, s);
		val(s, n, pos);
		ok := pos = 0;
	end;
end;

procedure leerchar(var entrada: text; var c: char; var ok: boolean);
var
	s: string;
begin
	ok := not eof();
	if ok then begin
		leerstring(entrada, s);
		ok := length(s) = 1;
		if ok then begin
			c := s[1];
		end;
	end;
end;

function camStr( s: string; var num: integer): integer;
var
	aux: integer;
begin
	val(s, num, aux);
	if aux <> 0 then begin
		result:= 0;		
	end
	else begin
		result := num;
	end;
end;

function stringcolor(s: string): TipoColor;
begin
    s := LowerCase(s); 
    case s of 
        'rojo': Result := Rojo;
        'azul': Result := Azul;
        'verde': Result := Verde; 
        'amarillo': Result := Amarillo;
    else 
        Result := Rojo; 
    end;
end;

function verstringcolor(var srt: string; var colorx: TipoLinea; var datosok: Boolean): TipoColor;
begin
  colorx.color := stringcolor(srt);
  if (srt = 'rojo') or (srt = 'azul') or (srt = 'verde') or (srt = 'amarillo') then begin
    datosok := True;
  end else begin
    datosok := False;
  end;
  Result := colorx.color;
end;


function leernumero(var entrada:string; var datosok: boolean):integer;
var	
	ix:integer;
begin
	ix:=0;	
	ix:= camStr(entrada,ix);
	if ix <> 0 then begin
		result:= ix;
	end
	else begin
		result:=0;
		datosok:=False;
	end;	

end;

procedure leerdatos(var entrada: text; var a: TipoLinea; var ok: boolean);
var 
    i: integer;
    s: string;  
begin
    ok := not eof(entrada);
    if ok then begin 
        leerstring(entrada, s);
        a.color := verstringcolor(s,a,ok);
        a.nnumeros := 0;
        for i := 1 to 5 do begin
            leerstring(entrada,s);
            if ok then begin
                inc(a.nnumeros);
                a.nums[i] := leernumero(s,ok);
            end else break;
        end;
    end; 
end;

procedure escribirdatos(var salida: text; a: TipoLinea);
var
  i: integer;
begin
  case a.color of 
    Rojo: write(salida, 'Rojo ');
    Azul: write(salida, 'Azul ');
    Amarillo: write(salida, 'Amarillo ');
    Verde: write(salida, 'Verde ');
  end;
  for i := 1 to a.nnumeros do
    write(salida, a.nums[i], ' ');
  writeln(salida);
end;

function calcularMedia(a: TipoLinea): real;
var
  suma: integer;
  i: integer;
begin
  suma := 0;
  for i := 1 to a.nnumeros do begin
    suma := suma + a.nums[i];
  end;
  if a.nnumeros > 0 then
    calcularMedia := suma / a.nnumeros
  else
    calcularMedia := 0;
end;

procedure leerCarton(var entrada: Text; var carton: TipoCarton; var ok: boolean);
var
  i: integer;
begin
  ok := true;
  carton.nlineas := 0;
  for i := 1 to 3 do begin
    leerdatos(entrada, carton.lineas[i], ok);
    if ok then
      inc(carton.nlineas)
    else
      break;
  end;
end;

function calcularMediaCarton(carton: TipoCarton): real;
var
  mediaTotal: real;
  i: integer;
begin
  mediaTotal := 0;
  for i := 1 to carton.nlineas do begin
    mediaTotal := mediaTotal + calcularMedia(carton.lineas[i]);
  end;
  calcularMediaCarton := mediaTotal / carton.nlineas;
end;

procedure ordenarCartones(var jug: TipoPlayer);
var
  i, j: integer;
  temp: TipoCarton;
begin
  for i := 1 to jug.ncartones - 1 do
    for j := i + 1 to jug.ncartones do
      if calcularMediaCarton(jug.cartones[i]) < calcularMediaCarton(jug.cartones[j]) then begin
        // Intercambia los cartones
        temp := jug.cartones[i];
        jug.cartones[i] := jug.cartones[j];
        jug.cartones[j] := temp;
      end;
end;


procedure imprimirCarton(carton: TipoCarton);
var
  i, j: integer;
begin
  for i := 1 to carton.nlineas do begin
    case carton.lineas[i].color of
      Rojo: write('Rojo ');
      Azul: write('Azul ');
      Amarillo: write('Amarillo ');
      Verde: write('Verde ');
    end;
    for j := 1 to carton.lineas[i].nnumeros do
      write(carton.lineas[i].nums[j], ' ');
    writeln;
  end;
  writeln;
end;

var
  entrada: Text;
  jugador: TipoPlayer;
  ok: boolean;
  i: integer;
begin
  assign(entrada, 'datos.txt');
  reset(entrada);
  jugador.ncartones := 0;

  while not eof(entrada) do begin
    ok := True;
    leerCarton(entrada, jugador.cartones[jugador.ncartones + 1], ok);
    if ok then
      inc(jugador.ncartones)
    else
      break;  
  end;
  Close(entrada);

  ordenarCartones(jugador);

  if jugador.ncartones > 0 then begin
    for i := 1 to jugador.ncartones do
      imprimirCarton(jugador.cartones[i]);
  end else begin
    writeln('Datos no guardados');
  end;
end.