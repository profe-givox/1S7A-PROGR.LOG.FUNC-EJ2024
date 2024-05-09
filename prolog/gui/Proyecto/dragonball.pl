mostrar(V,D,M):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D1,below(M)).




:- pce_global(@name_prompter, make_name_prompter).

        make_name_prompter(P) :-
                new(P, dialog),
                send(P, kind, transient),
                send(P, append, label(prompt)),
                send(P, append,
                        new(TI, text_item(name, '',
                                 message(P?ok_member, execute)))),
                send(P, append, button(ok, message(P, return, TI?selection))),
                %%send(P, append, button(ok, message(@prolog,pp))),
                send(P, append, button(cancel, message(P, return, @nil))).


        ask_name(Prompt, Label, Name) :-
                send(@name_prompter?prompt_member, selection, Prompt),
                send(@name_prompter?name_member, label, Label),
                send(@name_prompter?name_member, clear),
                get(@name_prompter, confirm_centered, RawName),
                send(@name_prompter, show, @off),
                RawName \== @nil,
                Name = RawName.

        ask_name :-
                ask_name('dragon ball personajes','Dbz', Dbz),
                pp(Dbz).
       ask_name1:-
                  ask_name('Relacion por:','Familia',Familia),
                  pp1(Familia).

        ask_name2:-
                  ask_name('Buscar','Dbz:',Dbz),
                  pp(Dbz).
        ask_name3:-
                  ask_name('Relacion por: ','Peleas:',Peleas),
                  pp3(Peleas).


        ask_name4:-
                  ask_name('Relacion por: ','Derrota:',Derrotado),
                  pp4(Derrotado).

start :-
        new(D,dialog('Busqueda de personajes z')),
        send(D,size,size(660,400)),
        send(D,colour,colour(red)),
        send(D, append, new(Menu, menu_bar)),
        send(Menu, append, new(Iniciar, popup(iniciar))),
        send(Menu,append,new(Iniciar1,popup('Relacion por: '))),
        send_list(Iniciar, append,
                         [ menu_item(iniciar, message(@prolog,ask_name))
                         ]),
        send_list(Iniciar1,append,
                      [menu_item(familiar,message(@prolog,ask_name1))
                      ]),
               send_list(Iniciar1,append,
                      [menu_item(pelea,message(@prolog,ask_name3))
                      ]),
               send_list(Iniciar1,append,
                      [menu_item('Derrotado',message(@prolog,ask_name4))
                      ]),

        mostrar('C:/Proyecto/dragonball/dbz.jpg',D,Menu),
        send(D,open,point(0,0)),
         consult('proyec.pl'),
           nl.

%lista de personajes dbz.

iman('Goku','C:/Proyecto/dragonball/Goku.jpg').
iman('Gohan','C:/Proyecto/dragonball/Gohan.jpg').
iman('Milk','C:/Proyecto/dragonball/Milk.jpg').
iman('Videl','C:/Proyecto/dragonball/Videl.jpg').
iman('Vegeta','C:/Proyecto/dragonball/Vegeta.jpg').
iman('Trunks','C:/Proyecto/dragonball/Trunks.jpg').
iman('Goten','C:/Proyecto/dragonball/Goten.jpg').
iman('Bulma','C:/Proyecto/dragonball/Bulma.jpg').
iman('Krilin','C:/Proyecto/dragonball/Krilin.jpg').
iman('Yamcha','C:/Proyecto/dragonball/Yamcha.jpg').
iman('Tenshinhan','C:/Proyecto/dragonball/Tenshinhan.jpg').
iman('Chaoz','C:/Proyecto/dragonball/Chaoz.jpg').
iman('Piccolo','C:/Proyecto/dragonball/Piccolo.jpg').
iman('Puar','C:/Proyecto/dragonball/Puar.jpg').
iman('Oloong','C:/Proyecto/dragonball/Oloong.jpg').
iman('Maestro roshi','C:/Proyecto/dragonball/Maestro roshi.jpg').
iman('Androide 16','C:/Proyecto/dragonball/Androide 16.jpg').
iman('Androide 17','C:/Proyecto/dragonball/Androide 17.jpg').
iman('Androide 18','C:/Proyecto/dragonball/Androide 18.jpg').
iman('Androide 19','C:/Proyecto/dragonball/Androide 19.jpg').
iman('Androide 20','C:/Proyecto/dragonball/Androide 20.jpg').
iman('Babidi','C:/Proyecto/dragonball/Babidi.jpg').
iman('Cell','C:/Proyecto/dragonball/Cell.jpg').
iman('Cell jr','C:/Proyecto/dragonball/Cell jr.jpg').
iman('Freezer','C:/Proyecto/dragonball/Freezer.jpg').
iman('Kingcold','C:/Proyecto/dragonball/Kingcold.jpg').
iman('Raditz','C:/Proyecto/dragonball/Raditz.jpg').
iman('Nappa','C:/Proyecto/dragonball/Nappa.jpg').
iman('Yamu y Spopovich','C:/Proyecto/dragonball/Yamu y Spopovich.jpg').
iman('Dabura','C:/Proyecto/dragonball/Dabura.jpg').
iman('Yakon','C:/Proyecto/dragonball/Yakon.jpg').
iman('Majin boo','C:/Proyecto/dragonball/Majin boo.jpg').
iman('Majin boo gordo','C:/Proyecto/dragonball/Majin boo gordo.jpg').



pp(Dbz):-
        new(D,dialog(Dbz)),
        send(D,size,size(660,500)),
        send(D,colour,colour(black)),
        send(D, append, new(Menu, menu_bar)),
        send(D, display, text(Dbz, center, normal), point(320,5)),

        raza(Dbz,Raza),
        send(D, display, text('Su raza es: ', center, normal), point(320,20)),
	nl,
        send(D, display, text(Raza, center, normal), point(440,20)),

        derrotado(Dbz,Derrotado),
	send(D, display, text('Es derrotado por:', center, normal), point(320,40)),
	nl,
        send(D, display, text(Derrotado, center, normal), point(440,40)),

        tecnica(Dbz,Tecnica),
	send(D, display, text('su tecnica es:', center, normal), point(320,60)),nl,
	nl,
        send(D, display, text(Tecnica, center, normal), point(440,60)),

         familiar(Dbz,Familiar),
	send(D, display, text('su familiar es:', center, normal), point(320,80)),nl,
	nl,
        send(D, display, text(Familiar, center, normal), point(440,80)),



	iman(Dbz,Foto)  ,
        mostrar(Foto,D,Menu),
        send(D,open,point(200,200)),
         nl.


pp1(Familia):-
        new(D,dialog(Familia)),
        send(D,size,size(560,400)),
        send(D,colour,colour(black)),
        send(D, append, new(Menu, menu_bar)),
        send(D, display, text(Familia, center, normal), point(320,5)),

        familiar(Familiar,Familia),
        raza(Familiar,Raza),
        send(D, display, text('Familiar: ', center, normal), point(320,20)),
        send(D, display, text(Familiar, center, normal), point(440,20)),
        send(D, display, text('Raza: ', center, normal), point(320,40)),
        send(D, display, text(Raza, center, normal), point(440,40)),


        send(Menu,append,new(Iniciar2,popup('Buscar: '))),
               send_list(Iniciar2,append,
                      [menu_item(Familiar,message(@prolog,ask_name2))
                      ]),

         iman(Familia,Foto)  ,
        mostrar(Foto,D,Menu),
        send(D,open,point(200,200)),
        nl.

pp3(Peleas):-
        new(D,dialog(Peleas)),
        send(D,size,size(560,400)),
        send(D,colour,colour(black)),
        send(D, append, new(Menu, menu_bar)),
        send(D, display, text(Peleas, center, normal), point(320,5)),
        peleas(Personaje, Peleas),
        raza(Personaje, Raza),
        send(D, display, text('Personaje: ', center, normal), point(320,20)),
        send(D, display, text(Personaje, center, normal), point(420,20)),
        send(D, display, text('Raza: ', center, normal), point(320,40)),
        send(D, display, text(Raza, center, normal), point(420,40)),


        send(Menu,append,new(Iniciar2,popup('Buscar: '))),
               send_list(Iniciar2,append,
                      [menu_item(personaje,message(@prolog,ask_name2))
                      ]),
                iman(Peleas,Foto)  ,
        mostrar(Foto,D,Menu),
        send(D,open,point(200,200)),
        nl.



 pp4(Derrotado):-
        new(D,dialog(Derrotado)),
        send(D,size,size(560,400)),
        send(D,colour,colour(black)),
        send(D, append, new(Menu, menu_bar)),
        send(D, display, text(Derrotado, center, normal), point(320,5)),
        derrotado(Personaje, Derrotado),
        raza(Personaje, Raza),
        send(D, display, text('Personaje: ', center, normal), point(320,20)),
        send(D, display, text(Personaje, center, normal), point(440,20)),
        send(D, display, text('Raza: ', center, normal), point(320,40)),
        send(D, display, text(Raza, center, normal), point(440,40)),


        send(Menu,append,new(Iniciar2,popup('Buscar: '))),
               send_list(Iniciar2,append,
                      [menu_item(personaje,message(@prolog,ask_name2))
                      ]),
                iman(Derrotado,Foto)  ,
        mostrar(Foto,D,Menu),
        send(D,open,point(200,200)),
        nl.










%raza de cada personaje.

raza('Goku','sayajin').
raza('Gohan','sayajin/humano').
raza('Milk','humano').
raza('Videl','humano').
raza('Vegeta','sayajin').
raza('Trunks','sayajin/humano').
raza('Goten','sayajin/humano').
raza('Bulma','humana').
raza('Krilin','humano').
raza('Yamcha','humano').
raza('Tenshinhan','humano').
raza('Chaos','humano').
raza('Piccolo','namekuseijin').
raza('Puar','animal').
raza('Oloong','animal').
raza('Maestro roshi','humano').
raza('Androide 16','androide').
raza('Androide 17','androide').
raza('Androide 18','androide').
raza('Androide 19','androide').
raza('Androide 20','androide').
raza('Babidi','extraterrestre').
raza('Cell','androide').
raza('Cell jr','androide').
raza('Freezer','extraterrestre').
raza('Kingcold','extraterrestre').
raza('Raditz','sayajin').
raza('Nappa','sayajin').
raza('Yamu y Spopovich','humanos').
raza('Dabura','demonio').
raza('Yakon','alien').
raza('Majin boo','extraterrestre').
raza('Majin boo gordo','extraterrestre').



%quien le gana a quien.

derrotado('Goku','nadie').
derrotado('Gohan','Dabura').
derrotado('Milk','--').
derrotado('Videl','--').
derrotado('Vegeta','Goku').
derrotado('Trunks','Cell').
derrotado('Goten','--').
derrotado('Bulma','--').
derrotado('Krilin','Freezer').
derrotado('Yamcha','Nappa').
derrotado('Tenshinhan','Nappa,Cell').
derrotado('Chaos','Nappa').
derrotado('Piccolo','Nappa').
derrotado('Puar','--').
derrotado('Oloong','--').
derrotado('Maestro roshi','--').
derrotado('Androide 16','Cell').
derrotado('Androide 17','Cell').
derrotado('Androide 18','Cell').
derrotado('Androide 19','Vegeta').
derrotado('Androide 20','Vegeta').
derrotado('Babidi','Majin boo').
derrotado('Cell','Gohan').
derrotado('Cell jr','Gohan').
derrotado('Freezer','Goku, Trunks').
derrotado('Kingcold','Trunks').
derrotado('Raditz','Piccolo').
derrotado('Nappa','Goku').
derrotado('Yamu y Spopovich','Majin boo').
derrotado('Dabura','Majin boo').
derrotado('Yakon','Goku').
derrotado('Majin boo','Goku').
derrotado('Majin boo gordo','Majin boo').

%poder de cada personaje

tecnica('Goku','kame hame haa, henkidama').
tecnica('Gohan','sayajin/mazenko').
tecnica('Milk','--').
tecnica('Videl','--').
tecnica('Vegeta','garlik hoo').
tecnica('Trunks','su espada').
tecnica('Goten','kame hame ha').
tecnica('Bulma','--').
tecnica('Krilin','kienzan').
tecnica('Yamcha','rafaa fufu ken').
tecnica('Tenshinhan','taioken').
tecnica('Chaos','paralizacion').
tecnica('Piccolo','makakonzapo').
tecnica('Puar','transformacion').
tecnica('Oloong','transformacion').
tecnica('Maestro roshi','kame hame ha').
tecnica('Androide 16','fuerza').
tecnica('Androide 17','rapidez').
tecnica('Androide 18','--').
tecnica('Androide 19','absorve energia').
tecnica('Androide 20','cientifico').
tecnica('Babidi','magia').
tecnica('Cell','absorbe').
tecnica('Cell jr','--').
tecnica('Freezer','transformacion').
tecnica('Kingcold','--').
tecnica('Raditz','--').
tecnica('Nappa','ca�on infernal').
tecnica('Yamu y Spopovich','--').
tecnica('Dabura','vuelve piadra a los demas con saliba').
tecnica('Yakon','come energia').
tecnica('Majin boo','absorve a sus oponentes, ').
tecnica('Majin boo gordo','transforma en dulces a sus oponentes').

% quien contra quien pelea

peleas('Goku','Nappa,Piccolo,Vegeta,Freezer,Majin boo,Cell').
peleas('Gohan','Cell').
peleas('Milk','--').
peleas('Videl','Gohan').
peleas('Vegeta','Goku').
peleas('Trunks','Freezer').
peleas('Goten','Majin boo').
peleas('Bulma','--').
peleas('Krilin','Freezer,Cell,Dabura,Majin boo').
peleas('Yamcha','Nappa').
peleas('Tenshinhan','Nappa,Goku').
peleas('Chaos','Nappa').
peleas('Piccolo','Nappa,Goku,Freezer,Cell,Majin boo').
peleas('Puar','--').
peleas('Oloong','--').
peleas('Maestro roshi','--').
peleas('Androide 16','Cell').
peleas('Androide 17','cell,Vegeta,Trunks').
peleas('Androide 18','cell,Vegeta,Trunks').
peleas('Androide 19','Vegeta').
peleas('Androide 20','Piccolo').
peleas('Babidi','--').
peleas('Cell','Gohan').
peleas('Cell jr','Gohan,Vegeta,Trunks,Tenshinhan,Yamcha,Krilin').
peleas('Freezer','Goku').
peleas('Kingcold','Trunks').
peleas('Raditz','Piccolo, Goku').
peleas('Nappa','Goku,Yamcha,Tenshinhan,Chaos,Piccolo').
peleas('Yamu y Spopovich','Videl,Gohan').
peleas('Dabura','Majin boo,Gohan').
peleas('Yakon','Goku').
peleas('Majin boo','Goku,Vegeta,Gohan,Piccolo').
peleas('Majin boo gordo','Goku,Vegeta,Gohan').

%familiares


familiar('Goku','Milk').
familiar('Gohan','Videl').
familiar('Milk','Goku').
familiar('Videl','Gohan').
familiar('Vegeta','Bulma').
familiar('Trunks','Vegeta').
familiar('Goten','Goku').
familiar('Bulma','Trunks').
familiar('Krilin','--').
familiar('Yamcha','Puar').
familiar('Tenshinhan','Chaos').
familiar('Chaos','Tenshinhan').
familiar('Piccolo','--').
familiar('Puar','Yamcha').
familiar('Oloong','Maestro Roshi').
familiar('Maestro roshi','Oloong').
familiar('Androide 16','--').
familiar('Androide 17','Androide 18').
familiar('Androide 18','Androide 17').
familiar('Androide 19','--').
familiar('Androide 20','--').
familiar('Babidi','majin boo').
familiar('Cell','Cell jr').
familiar('Cell jr','Cell').
familiar('Freezer','Kingcold').
familiar('Kingcold','Frezzer').
familiar('Raditz','Goku').
familiar('Nappa','--').
familiar('Yamu y Spopovich','--').
familiar('Dabura','--').
familiar('Yakon','--').
familiar('Majin boo','Babidi').
familiar('Majin boo gordo','--').




