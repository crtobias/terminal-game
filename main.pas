program untiled;
uses crt,dos;

const
	tam = 10;

type

player = record
	Name:string;
	hp:integer;
	dmg:integer;
	pos:integer;
end;

mob = record
	name:string;
	hp:integer;
	dmg:integer;
	pos:integer;
end;


typeMap = array[1..tam] of char;

procedure Bienvenida(name:string;var op:integer);
begin
	clrscr;
	gotoxy(20, 7);
    textbackground(black);
    textcolor(Green);
	writeln('|==============================|');
	gotoxy(20, 8);
	writeln('|           bienvenido         |');  
	gotoxy(20, 9);
	writeln('|        quieres jugar?        |');  
	gotoxy(20, 10);
	writeln('|       1=si         2= no     |');  
	gotoxy(20, 11);
	writeln('|==============================|');
	readln(op)
end;

procedure Verificacion(op:integer);
begin
	if op = 1 then
		writeln('verificacion completada')
	else if op=2 then
		begin
			writeln('Nos vemos luego...');
		end
	else
		writeln('Amigo tenias que elegir 1 o 2 y ni eso haces bien')
end;


procedure CrearPlayer(var P:player);
var
	clas:integer;
begin
	clrscr;
	gotoxy(20, 7);
    textbackground(black);
    textcolor(Green);
	writeln('|==     /elige una clase/    ==|');
	gotoxy(20, 8);
	writeln('|          1 = tanke           |');  
	gotoxy(20, 9);
	writeln('|          2 = asesino         |');  
	gotoxy(20, 10);
	writeln('|          3 = default         |');  
	gotoxy(20, 11);
	writeln('|==============================|');
	readln(clas);
	
	if clas = 1 then
		begin
			writeln('tanke seleccionado');
			P.hp := 50;
			P.dmg := 3;
		end
	else if clas=2 then
		begin
			writeln('asesino seleccionado');
			P.hp := 30;
			P.dmg := 7;
		end
	else if clas=3 then
		begin
			writeln('default  seleccionado');
			P.hp := 40;
			P.dmg := 5;
		end
	else
		writeln('Amigo tenias que elegir 1,2 o 3 y ni eso haces bien');
		
	writeln('ingrese el nombre');
	readln(P.Name);
	P.pos:=1;
		
end;


procedure iniciarMapa(var M:typeMap; P:player;Mb:mob);
var i:integer;
begin
	writeln('iniciado Map...');
	for i:=1 to tam do begin
		M[i]:= '-' ;
	end;
	writeln('Map iniciado');
	M[P.pos]:= 'P';
	M[Mb.pos]:= 'M';
end;




procedure cargarMapa(var M:typeMap; P:player;Mb:mob);
begin
	
	M[P.pos]:= 'P';
	M[Mb.pos]:= 'M';
	Delay(1000);
	clrscr;
	gotoxy(20, 9);
    textbackground(black);
    textcolor(Green);
	writeln('|==============================|');
	gotoxy(20, 10);
	writeln('|          ',M[1],M[2],M[3],M[4],M[5],M[6],M[7],M[8],M[9],M[10],'          |');  

	gotoxy(20, 11);
	writeln('|==============================|');
	gotoxy(20, 12);
	writeln('|HP: ',P.HP ,'=================|');
end;

procedure IniciarMob(var m:mob);
begin
	m.name:= 'spider';
	m.hp:= 50;
	m.pos:= 6;
	m.dmg:= 7;
	writeln('iniciando enemigo');
end;

procedure HealP(var P:player);
begin
	writeln('curando');
	P.hp := P.hp + 2;
end;

procedure MovP(var P:player; var M:typeMap ; mob:mob);
var
	memo : integer ;
begin
	writeln('moviendo');
	memo := p.pos;
	M[memo] := '-';
	P.pos := P.pos + 1;
	cargarMapa(M,P,mob);
end;

procedure DmgP(var P:player; var M:typeMap; var mob:mob);
begin
	writeln('atacando');
end;

//1=MOVER 2=CURAR 3=ATACAR //
procedure ElegirMov(var M:typeMap ; var P:player; mov:integer; var mob:mob);
begin
	if mov = 1 then
		movP(P,M,mob)
	else if mov = 2 then 
		Healp(P)
	else if mov = 3 then 
		dmgP(P,M,mob)
	else
		writeln('elegi bien capo');
end;


var
 name:string;
 op:integer;
 P:player;
 Map: typeMap;
 mob1:mob;
BEGIN
	name:='pepeasdasdasd';
	Bienvenida(name,op);
	Verificacion(op);
	if op = 1 then
	begin
		CrearPlayer(P);
		IniciarMob(mob1);
		iniciarMapa(Map,p,mob1);
		cargarMapa(Map,p,mob1);
		while P.pos < tam do 
			begin
				elegirMov(Map,P , 1 ,mob1);
			end;
	end;
END.



