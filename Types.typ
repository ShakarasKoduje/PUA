TYPE
	RoomTyp : STRUCT
		diPstryk : ARRAY[1..2] OF BOOL; (* Obs³uga w³¹czników œwiat³a *)
		doLampa : ARRAY[1..2] OF BOOL; (* obs³uga lamp *)
		diTemperatura : INT; (* Odczyt Temperatury - sonda PT1000 *)
	
	END_STRUCT;
	
	HouseTyp : STRUCT
		Jadalnia : RoomTyp;
		Kuchnia : RoomTyp;
		Sypialnia : RoomTyp;
		
	END_STRUCT;		 
END_TYPE