{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

Program ejercico4;

Uses math;

Const 

  Pi : Real = 3.14;

Var 

  Caracter : char = 'k' ;
  Caracter2 : char = 'Y';
  Num : Integer = 100;
  Caract : char = 'z';
  Num2 : Real = 65;
  Num3 : Real = 15;

Begin

  Writeln ('k su mayuscula es:', char(ord(caracter)-ord('a')+ord('A')));
  Writeln ('Y su minuscula es:', char(ord(caracter2)-ord('A')+ord('a')));
  Writeln('El doble del numero 9 es ',2*(ord('9')-ord('0')));
  Writeln (Num, ' ¿Es par? ', Num Mod 2 = 0 );
  WriteLn ('Suponiendo la a como posición 1 ¿sera ', Caract , ' impar? ', ord(Caract) Mod 2 <> 0);
  WriteLn ('Un rectangulo de primer lado 16 y de segundo lado 24 su area sera:', 16*24);
  Writeln ('El volumen de una circulo de radio ' , Num2: 0: 2 ,' sera este:' , Pi * Num2 ** 2 : 0: 2);
  WriteLn ('¿Tiene un rectángulo de lado ', Num2: 0: 2, ' y de otro lado ', Num3: 0: 2 , ' y una esfera de radio ', Num2: 0: 2, ' el mismo área? ', Abs((Num2 * Num3) - (Pi * Num2 ** 2)) <=0.0005);
  Writeln('La solución a la ecuación x^2 - 4x + 3 = 0: ', ((-4) + Sqrt(4 * 4 - 4 * 1 * 3)) / (2 * 1): 0: 2);

End.
