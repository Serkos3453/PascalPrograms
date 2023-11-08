{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}


Program ejer2;


Const 
  Mes: Integer = 12;
  Horasysegundos : Integer = 3600;
  Mintcons : integer = 60;
Function Versiesminus(letra : Char) : Boolean;
Begin
  result := (ord('a')<= ord(letra))And (ord(letra) <=ord('z'));
End;
Function Versiesmayus(letra : Char) : Boolean;
Begin
  result := (ord('A')<= ord(letra))And (ord(letra) <=ord('Z'));
End;
Function Versiesdi(digit : char) : Boolean;
Begin
  result := (ord('0')<= ord(digit))And (ord(digit) <=ord('9'));
End;
Function versiesle(letra : char) : Boolean;
Begin
  result := (Versiesmayus(letra)) Or (Versiesminus(letra));
End;
Function versiesleonum( digle : char) : Boolean;
Begin
  result := (Versiesle(digle)) Or (Versiesdi(digle));
End;
Function sigmes(meses : integer) : integer;
Begin
  result := ((meses Mod Mes)+1 );
End;
Function sigmesd(meses1 : integer) : integer;
Begin
  result := (sigmes(meses1 - 2 + Mes ));
End;
Function horas( hora : integer) : integer;
Begin
  result := (hora * 3600);
End;
Function minut( minutos : integer) : integer;
Begin
  result := (minutos * 60);
End;
Function segundosum( hora , minutos , segundos : integer) : integer;
Begin
  result := (horas (hora)  + minut(minutos)  + segundos);
End;
Function minut2( minutox : Integer) : Integer;
Begin
  result := (minutox * 60);
End;
Function segunsum2( minutox , segundos2 : Integer) : Integer;
Begin
  result := (minut2(minutox) + segundos2);
End;
function rest(restseg1 , restseg2 : Integer) : Integer;
begin
  result := (restseg2-restseg1);
end;
function horas3 (temp : integer ) : integer; 
begin
  result := (temp div Horasysegundos);
end;
function minut3 (temp : Integer ) : Integer;
begin
  result := (temp mod Horasysegundos) div Mintcons;
end;
function segundos3 (temp : integer) : integer;
begin
  result := (temp mod Mintcons);
end;
Const 
  H : integer = 4;
  M : Integer = 35;
  S : Integer = 43;
  Letra : char = 'c';
  Letra2 : char = 'F';
  Caracter : Integer = 4;
  Letra3 : char = 'x';
  Numyd  : Integer = 3;
  H2 : Integer = 6; 
  M2 : Integer = 23;
  S2 : Integer = 17;

Begin
  writeln ('La letra ' , Letra , ' es minuscula ' ,Versiesminus('c'));
  writeln ('La letra ' , Letra2, ' es mayuscula ' ,Versiesmayus('F'));
  WriteLn ('El numero ' , Caracter , ' sera un digito ' , Versiesdi('4'));
  WriteLn ('Es ', Letra3 , ' sera una letra ' , Versiesle('x'));
  WriteLn ( Numyd , ' sera una letra o un digito ' , versiesleonum('3'));
  WriteLn (sigmes(12));
  WriteLn (sigmesd(1));
  writeln ('El total de segundos para ', H , ' horas ', M , ' minutos', S , ' segundos es: ' , segundosum( H , M , S));
  WriteLn ('El total de segundos para ', M ,' minutos y ', S , ' segundos es: ', segunsum2(M , S));
  WriteLn ('Horas ',Horas3(rest(segundosum(H,M,S), segundosum(H2,M2,S2))));
  WriteLn ('Minutos ',minut3(rest(segundosum(H,M,S), segundosum(H2,M2,S2))));
  WriteLn ('Segundos ',segundos3(rest(segundosum(H,M,S), segundosum(H2,M2,S2))));
End.
