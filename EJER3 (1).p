{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program ejercicio3;

const

  MinimoYear : Integer = 1000;
  MaximYear : Integer = 2210;
  MinMonth : Integer = 1;
  MaxMonth :  Integer = 12;
  Sumyear : Integer = 2000; 

function chyear (Year1 :Integer) : Integer;
begin
   if Year1 <=99 then begin 
    result := Year1 + Sumyear;
    end 
   else begin 
    result := Year1;
    end;
end;
function Yeax ( Year1 : Integer ) : Boolean;
begin
  result := (Year1 >= MinimoYear) and (Year1 <= MaximYear);
end;

function Monthx ( Month1 : Integer ) : Boolean;
begin
  result := (Month1 >= MinMonth) and (Month1 <= MaxMonth);
end;

function bisyear(Year1 : Integer ) : Boolean  ; 
begin
  result := (Year1 mod 4 = 0) and ( Year1 mod 100 = 0) or (Year1 mod 400 = 0);
end;
  
function Dix(Year1, Month1: integer): integer;
begin
	case Month1 of
	1, 3, 5, 7, 8, 10, 12:
		result := 31;
	2:
		if bisyear(Year1) then begin
			result := 29
		end
		else begin
			result := 28;
		end;
	otherwise
		  result := 30;
	end;
end;

function diabn(Year1, month1, Day1  : integer): boolean;
begin
	result := (Day1 >= 1) and (Day1 <= Dix(Year1, Month1));
end;

function fechabn(Year1, Month1, Day1: integer): boolean;
begin
	result := Yeax(Year1) and Monthx(Month1) and diabn(Year1, Month1, Day1);
end;
function fechasgod (Year1,Year2,Month1,Month2,Day1,Day2: integer): boolean;
begin
  result := fechabn(Year1 , Month1 , Day1) and fechabn(Year2, Month2 , Day2);
end;
function fechasord (Year1 , Year2 , Month1 , Month2 , Day1 , Day2 : Integer) : Boolean;
begin
  if Year1 > Year2 then begin
    result := False;
  end 
  else if (Year1 = Year2) and (Month1 > Month2) then begin
    result := False; 
  end 
  else if  (Year1 = Year2) and (Month1 = Month2) and (Day1 > Day2) then begin
    result := False;
  end 
  else begin 
    result := True;
  end;
end;
const
  Anyo1 : Integer = 1800;
  Month12 : Integer = 6;
  Day12 : Integer = 14;
  Anyo2 : Integer = 1931; 
  Month21 : Integer = 2;
  Day21 : Integer = 11;
begin
  if not fechasgod(chyear(Anyo1), chyear(Anyo2) ,Month12 ,month21 , Day12 , Day21) then begin 
    writeln('Fechas no validas');
  end 
  else if not fechasord(chyear(Anyo1),chyear(Anyo2),month12 , month21 , Day12 , Day21) then begin
    writeln('Fechas desordenadas');
  end
  else begin 
   writeln ('La primera fecha es: ',chyear(Anyo1), ' anyo ', month12 , ' mes ' , Day12 , ' dia. Este anyo es bisiesto ', bisyear(chyear(Anyo1)));
   writeln ('La primera fecha es: ',chyear(Anyo2), ' anyo ', month21 , ' mes ' , Day21 , ' dia. Este anyo es bisiesto ', bisyear(chyear(Anyo2)));
  end 
end.
