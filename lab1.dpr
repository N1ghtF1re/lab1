program lab1;
{$APPTYPE CONSOLE}
uses
  SysUtils, Windows,  math;

var xn, xk, dx, e, x, y: real;
//
procedure getY(x: real); 
begin
  if((x <= 0) or (pi*pi - x*x + 1/x = 0)) then
    writeln('При x = ', x:0:4, ' значение функции не определено')
  else
  begin
    y:=pi*pi - x*x + 1/x;

    if(y<0) then
    begin
      y:=(-1)*Power(abs(y), 1/3);
    end

    else
    begin
        y:=Power(y, 1/3);
    end;

    y:= Log10(x)/y;
    y:= y + Power(abs(1.5 - x*x), 1/2)*Tan((x-1)/x);
    writeln('x = ', x:0:4, '; y = ', y:0:4);
  end;
end;

begin
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251); // Включаем поддержку русских символов

  repeat
    writeln('Введите начальное значение x');
    readln(xn);
    writeln('Введите конечное значение x');
    readln(xk);
    writeln('Введите шаг');
    readln(dx);
    if ((xn>xk) and (dx >= 0))
       or
       ((xn<xk) and (dx <= 0)) then
    begin
      writeln; // Создаем отступ
      writeln; //
      writeln('Введены некорректные данные. Попробуйте еще раз');
      writeln; //
      writeln; //
    end;
  until ((xn<=xk) and (dx > 0))
        or
        ((xn>=xk) and (dx < 0));

  e:=dx/1000;  // Погрешность.
  x:=xn;
  while(((x < xk + e) and (dx > 0))
       or
       ((x > xk + e) and (dx < 0))) do
  begin
    getY(x);
    x:= x + dx;
  end;

  // Проверка, было ли просчитано значение функции для xk
  if(((x - dx + e - xk < 0) and (dx > 0))
    or
    ((xk - (x - dx + e) < 0) and (dx < 0))) then
  begin
    getY(xk);
  end;


  readln;
end.



