TYPE
	RoomTyp : STRUCT
		diPstryk : ARRAY[1..2] OF BOOL; (* Obs�uga w��cznik�w �wiat�a *)
		doLampa : ARRAY[1..2] OF BOOL; (* obs�uga lamp *)
		diTemperatura : INT; (* Odczyt Temperatury - sonda PT1000 *)
		diFotokomorka : ARRAY[1..2] OF BOOL; (*Odczyt stygna��w z gotokomorek *)
		aiSciemniacz: ARRAY[1..2] OF INT; (* obsluga sciemniacza swiatla *)
		aoLampa : ARRAY[1..2] OF INT; (*Obsluga lampy w trybie sciemniania *)	
	END_STRUCT;
	
	HouseTyp : STRUCT
		Jadalnia : RoomTyp;
		Kuchnia : RoomTyp;
		Sypialnia : RoomTyp;
		Korytarz : RoomTyp;
	END_STRUCT;		 
END_TYPE