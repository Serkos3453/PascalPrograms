{$mode objfpc}{$H-}{$I+}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program EJER9;

const
  MaxString = 50;
  NumMax = 100000;
  Tab: char = '	';
  Maxalumnos = 1000;
type 
  TString = String[MaxString];
  Carreras = (Aero, Pollologia, Teleco);
  Calif = (apto , noapto);

  Califx = record 
	calx : Calif;
	notax : Real;
  end;

  Nif = record
    numero: 1..NumMax;
    letra: 'A'..'Z';
  end;

  alumno = record
    carrera: Carreras;
    NumInFis: Nif;
	  Nota : Califx;
	  Nota2 : Califx;
  end;

   TipoStr = record
	 cars: string[MaxString];
	 ncars: integer;
   end;

	Alumnos = array[1..Maxalumnos] of alumno;

	Tipclase = record 
      alumnox : Alumnos;
	  numalumno	: Integer;
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

function stringtocarrera(s: string): Carreras;
begin
    case s of
        'Aero': result := Aero;
        'Pollologia': result := Pollologia;
        'Teleco': result := Teleco;
    else
        Result := Teleco;
    end;
end;

function verstringcar(var srt: String; var carr : alumno; var datosok : Boolean):Carreras;
begin
    carr.carrera := stringtocarrera(srt); 
    if (srt <> 'Aero') and (srt <> 'Pollologia') and (srt <> 'Teleco') then begin
        WriteLn('Carrera desconocida: ', srt);
        datosok := False;
    end;
    Result := carr.carrera;
end;


function stringtocalif(s: string): Calif;
begin
	case s of
		'apto': result := Apto;
		'noapto': result := NoApto;
		else 
    Result := apto;
	end;
end;

function verstringtocalif(var srt: string; var datosok: Boolean):Calif;
begin
  if (srt = 'apto') or (srt = 'noapto') then begin
    Result := stringtocalif(srt);
  end
  else begin
    Result := noapto;
    writeln('Calificacion desconocida: ', srt);
    datosok := False;
  end;
end;

function leernif(var entrada:string; var datosok: boolean):integer;
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


function leernifletra(var entrada: string; var datosok: boolean): char;
begin
  if (length(entrada) = 1) and (entrada >= 'A') and (entrada <= 'Z') then begin
    result := entrada[1];
  end
  else begin
    result := 'A';
    datosok := False;
  end;
end;



function stringtonota(var s: string): Real;
var
  f: Real;
  pos: integer;
begin
  val(s, f, pos);
  if (pos = 0) and (f >= 0) and (f <= 10) then  
    result := f
  else
    WriteLn('nota desconocida');
end;


procedure leerdatos(var entrada: text; var a: alumno; var ok: boolean);
var 
s : string; 
begin 
  ok := not eof(entrada);
  if ok then begin
    leerstring(entrada, s);
    a.carrera := verstringcar(s,a ,ok);
  end;
  if ok then begin
    leerstring(entrada, s);
    a.NumInFis.numero := leernif(s, ok);
  end;
  if ok then begin  
  	leerstring(entrada, s);
    a.NumInFis.letra := leernifletra(s, ok)
  end;
  if ok then begin 
  	leerstring(entrada,s);
  	a.Nota.calx := verstringtocalif(s,ok)
  end;
  if ok then begin
  	leerstring(entrada,s);
  	a.Nota2.calx := verstringtocalif(s,ok);
  end; 
  if ok then begin
  	leerstring(entrada,s);
  	a.Nota.notax := stringtonota(s);
  end; 
  if ok then begin
  	leerstring(entrada,s);
  	a.Nota2.notax := stringtonota(s);
  end;

  if (a.Nota.calx = NoApto) or (a.Nota2.calx = NoApto) then begin
    a.Nota.notax := 0.0;
	a.Nota2.notax := 0.0;
  end;

end;

function medidiv(alum: alumno): real;
var
  ix: real;
begin
  ix := 0;
  ix := ix + alum.Nota.notax + alum.Nota2.notax;
  result := ix / 2;
end;


function mediaglobal (sumt:real; numl:integer):real;
begin
	result:= sumt / numl;

end;

procedure ordenarmedia(var arr: Alumnos; numAlumnos: Integer);
var
  i, j: Integer;
  temp: alumno;
  media1 : Real;
  media2: Real;
begin
  for i := 1 to numAlumnos - 1 do
    for j := 1 to numAlumnos - i do begin
      media1 := medidiv(arr[j]);
      media2 := medidiv(arr[j + 1]);
      if media1 < media2 then begin
        temp := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := temp;
      end;
    end;
end;

procedure impridatos(var datosin : Tipclase);
var 
i : integer;
aux : real;
begin
  aux := 0; 
  for i := 1 to datosin.numalumno do begin
	WriteLn (datosin.alumnox[i].NumInFis.numero,'-',datosin.alumnox[i].NumInFis.letra,' ',datosin.alumnox[i].carrera,' ',medidiv(datosin.alumnox[i]):0:2);
	aux := aux + medidiv(datosin.alumnox[i]);
  end;
  WriteLn('La media es: ', mediaglobal(aux,datosin.numalumno):0:2);
end;


var
ls : text;
datfichero : string = ('datos.txt');
note : boolean;
balumno : Tipclase;
begin
  assign(ls, datfichero);
  reset(ls);
  balumno.numalumno := 0;
 while not eof(ls) do begin
  note := True; 
  leerdatos(ls, balumno.alumnox[balumno.numalumno + 1], note);
  if note then
    balumno.numalumno := balumno.numalumno + 1
  else
   break;  
  end;
  Close(ls);
  ordenarmedia(balumno.alumnox, balumno.numalumno); 
  if balumno.numalumno > 0 then begin
    impridatos(balumno);
  end 
  else begin
    writeln('Datos no guardados');
  end;
end.