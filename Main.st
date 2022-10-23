
PROGRAM _INIT
	(* Insert code here *)
	uiLightControlMode := 3;
	//uiZegar_PT[1] := 1
	 
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	CASE uiLightControlMode OF
		1: //Klasyczne sterowanie z w³¹cznikimem bistabilnym
			Dom.Jadalnia.doLampa[1] := Dom.Jadalnia.diPstryk[1];
		2: //dotyk
			Dom.Jadalnia.doLampa[1] := EDGEPOS(Dom.Jadalnia.diPstryk[1]) XOR Dom.Jadalnia.doLampa[1];
		3: //swiatlo mrugajace
			ZegarTon[1].IN:= Dom.Jadalnia.diPstryk[2] AND NOT(ZegarTon[1].Q);
		//	ZegarTon[1].PT:= T#1s; //zadanie czasu 1s poprzez deklaracje T#
			//ZegarTon[1].PT:= REAL_TO_TIME(uiZegarTON_PT[1]*1000); //zadanie czasu 1s poprzez deklaracje T#

			ZegarTon[1](); //FUB
			Dom.Jadalnia.doLampa[1] := Dom.Jadalnia.diPstryk[2] AND (ZegarTon[1].Q XOR Dom.Jadalnia.doLampa[1]);
			IF EDGEPOS(Dom.Jadalnia.doLampa[1]) THEN
				ZegarTon[1].PT := REAL_TO_TIME(uiZegarTON_PT[1]*1000);
			END_IF
			IF EDGENEG(Dom.Jadalnia.doLampa[1]) THEN
				ZegarTon[1].PT := REAL_TO_TIME(uiZegarTON_PT[2]*1000);
			END_IF				
			
	END_CASE	
	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

