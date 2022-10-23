
PROGRAM _INIT
	(* Insert code here *)
	uiLightControlMode := 5; //case 5
	//uiZegar_PT[1] := 1
	(* ALE NIE WIEM CZY PONIZSZE USTAWIENIA DZIALAJA *)
	uiZegarTON_PT[1] := 1;
	//ZegarTON[2].PT := 3;
	uiZegarTON_PT[2] := 3;
	uiZegarTOF_PT[1] := 3;
	 
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	CASE uiLightControlMode OF
		1: //Klasyczne sterowanie z w³¹cznikimem bistabilnym
			Dom.Jadalnia.doLampa[1] := Dom.Jadalnia.diPstryk[1];
		2: //dotyk
			Dom.Jadalnia.doLampa[1] := EDGEPOS(Dom.Jadalnia.diPstryk[1]) XOR Dom.Jadalnia.doLampa[1];
		3: //swiatlo mrugajace
			ZegarTON[1].IN:= Dom.Jadalnia.diPstryk[2] AND NOT(ZegarTON[1].Q);
		//	ZegarTon[1].PT:= T#1s; //zadanie czasu 1s poprzez deklaracje T#
			//ZegarTon[1].PT:= REAL_TO_TIME(uiZegarTON_PT[1]*1000); //zadanie czasu 1s poprzez deklaracje T#

			ZegarTON[1](); //FUB
			Dom.Jadalnia.doLampa[1] := Dom.Jadalnia.diPstryk[2] AND (ZegarTON[1].Q XOR Dom.Jadalnia.doLampa[1]);
			IF EDGEPOS(Dom.Jadalnia.doLampa[1]) THEN
				ZegarTON[1].PT := REAL_TO_TIME(uiZegarTON_PT[1]*1000);
			END_IF
			IF EDGENEG(Dom.Jadalnia.doLampa[1]) THEN
				ZegarTON[1].PT := REAL_TO_TIME(uiZegarTON_PT[2]*1000);
			END_IF				
		4:
			ZegarTOF[1].IN := Dom.Korytarz.diFotokomorka[1];
			ZegarTOF[1].PT := REAL_TO_TIME(uiZegarTOF_PT[1] *1000);
			ZegarTOF[1]();
			Dom.Korytarz.doLampa[1] := ZegarTOF[1].Q;
		5: //Œciemniacz\
//			Skaluj[1].x := INT_TO_REAL(Dom.Jadalnia.aiSciemniacz[1]);
//			Skaluj[1].x1 := 0;
//			Skaluj[1].y1 := 13000;
//			Skaluj[1].x2 := 32767;
//			Skaluj[1].y2 := 30000;
//			Skaluj[1]();
		//	Dom.Jadalnia.aoLampa[1] := REAL_TO_INT(Skaluj[1].y);
			Skaluj[1].x := INT_TO_REAL(Dom.Jadalnia.aiSciemniacz[2]);
			Skaluj[1].x1 := 320; (*dolna temperatura w termometrze *)
			Skaluj[1].y1 := 13000; (*dolna granica w ktorej, zarowka jeszcze nie swieci *)
			Skaluj[1].x2 := 370; (*gorna granica temperatury *)
			Skaluj[1].y2 := 30000; (*gorna granica swiecenia zarowk *)
			Skaluj[1]();
			Dom.Jadalnia.aoLampa[1] := REAL_TO_INT(Skaluj[1].y);
		
		
		//Dom.Korytarz.doLampa[1] :=
	END_CASE	
	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

