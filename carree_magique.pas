//ALGORITHME : carree magique
//BUT : Afficher un tableau ou le 1 est au nord du milieu de la table, et affiche toute les valeurs dans l'ordre croissante en partant du 1 vers la droite
//ENTREE : la confirmation pour afficher le tableau
//SORTIE : Le tableau qui affiche tout les nombres au bon endroit en partant du 1.
//CONST
//	MAX=5
//TYPE
//	Tableau2dim:tableau[1..MAX,1..MAX] DE ENTIER
//Procédure Affichage(tab4:Tableau2dim)
//	VAR
//		i,j:ENTIER
//	DEBUT
//		POUR j <- 1 A MAX FAIRE
//			DEBUT
//				POUR i <- 1 A MAX FAIRE
//					DEBUT
//						SI tab4[i,j]<=9 ALORS
//							ECRIRE("  "& tab4[i,j])
//						SINON
//							ECRIRE(" "& tab4[i,j])	
//						FINSI
//					FIN
//				ECRIRE
//				FINPOUR
//			FIN
//		FINPOUR
//	FIN
//Procédure TestBordureDroite(var tbdx:ENTIER; var tbdy:ENTIER)
//	DEBUT
//		SI tbdx>MAX ALORS
//			DEBUT
//				tbdx <- 1  		
//			FIN
//		FINSI
//		SI tbdy<1 ALORS
//			DEBUT
//				tbdy <- MAX
//			FIN
//		FINSI
//	FIN
//Procédure TestBordureGauche(var tbgx:ENTIER; var tbgy:ENTIER)
//	DEBUT
//		SI tbgx-1<1 ALORS
//			tbgx <- MAX
//		SINON
//			tbgx <- x2-1
//		FINSI
//		SI tbgy-1<1 ALORS
//			tbgy <- MAX
//		SINON
//			tbgy <- tbgy-1
//		FINSI
//	FIN
//Fonction Test (tab2:Tableau2dim; tx:ENTIER ; tx:ENTIER) 	
//	DEBUT
//		SI tab2[tx,ty]=0 ALORS
//			Test <- VRAI
//		SINON
//			Test <- FAUX
//		FINSI
//	FIN
//Procedure Initialisation(VAR matrice1:Tableau2dim; VAR abs:ENTIER; VAR ord:ENTIER);
//	VAR
//		i,j:ENTIER			
//	DEBUT
//		POUR j <- 1 A MAX FAIRE
//			DEBUT
//				POUR i <- 1 A MAX FAIRE
//					DEBUT
//						matrice1[i,j] <- 0
//					FIN
//				ECRIRE
//				FINPOUR
//			FIN
//		matrice1[(MAX/2)+1,(MAX/2) <- 1]
//		abs <- ((MAX/2)+1)
//		ord <- (MAX/2)
//		FINPOUR
//	FIN
//Procédure Remplissage(VAR tab:Tableau2dim; VAR x:ENTIER; VAR y:ENTIER)  	
//	VAR
//		i,j:ENTIER
//			
//	DEBUT
//		POUR i <- 2 A (MAX*MAX) FAIRE
//			x <- x+1
//			y <- y-1
//			TestBordureDroite(x,y) //Lancement procédure TestBordureDroite, verification coodonnées dépassent bordure droite ET/OU sommet
//			SI (Test(tab,x,y)=FAUX) ALORS //Test(tab,x,y)=VRAI
//				DEBUT
//					REPETER
//						TestBordureGauche(x,y)
//					JUSQU'A (Test(tab,x,y)=VRAI)
//					FINREPETER
//				FIN
//			tab[x,y] <- i
//			LIRE Affichage(tab)
//			FINSI
//		FINPOUR
//	FIN
//	VAR
//	matrice:Tableau2dim
//	abscisse,ordonnee:ENTIER
//DEBUT
//	matrice <- Initialisation
//	abscisse <- Initialisation
//	ordonnee <- Initialisation
//	Remplissage(Matrice,abscisse,ordonnee)
//	LIRE
//FIN


PROGRAM carree_magique.pas;

USES crt, math ;

CONST
	MAX=5;

TYPE
	Tableau2dim=ARRAY [1..MAX,1..MAX] OF integer;


Procedure affichage(tab4:Tableau2dim);                   

	VAR
		i,j:INTEGER;
			 	
	BEGIN
		FOR j:=1 TO MAX DO
			BEGIN
			 	FOR i:=1 TO MAX DO
			 		BEGIN
			 			 IF (tab4[i,j]<=9) THEN			//Permet de s'occuper de l'espace entre les valeurs du tableau
			 			 	write ('  ',tab4[i,j])
			 			 ELSE
			 			 	write (' ',tab4[i,j])
			 		END;
			 	writeln;
			END;
	END;
Procedure TestBordureDroite(VAR tbdx:INTEGER; VAR tbdy:INTEGER);
	BEGIN
		IF (tbdx>MAX) THEN
			BEGIN
				tbdx:=1;
			END;
			IF (tbdy<1) THEN							//Permet de tester si les caractère ont atteint la bordure maximum du tableau
				BEGIN									//et renvois a la ligne a la bordure gauche
					tbdy:=MAX;
				END;
	END ;
Procedure TestBordureGauche(VAR tbgx:INTEGER ;VAR tbgy:INTEGER);
	BEGIN
		IF (tbgx-1<1) THEN
			BEGIN
				tbgx:=MAX;
			END
		ELSE
			BEGIN
				tbgx:=(tbgx-1);							//Procédure inverse du testbordure droite
			END;
		IF (tbgy-1<1) THEN
			BEGIN
				tbgy:=MAX;
			END
		ELSE
			tbgy:=tbgy-1
	END;
Function Test(tab2:Tableau2dim; tx:INTEGER; ty:INTEGER):BOOLEAN;
	BEGIN
		IF tab2[tx,ty]=0 THEN
			Test:=TRUE
		ELSE
			Test:=FALSE
	END;
Procedure Initialisation(VAR matrice1:Tableau2dim; VAR abs:INTEGER; VAR ord:INTEGER);
	VAR
		i,j:INTEGER;
	BEGIN
		FOR j:=1 TO MAX DO
			BEGIN
				FOR i:=1 TO MAX DO
					BEGIN
						matrice1[i,j]:=0;
					END;
				writeln;
			END;
		matrice1[(MAX DIV 2)+1,(MAX DIV 2)]:=1;				
		abs:=((MAX DIV 2)+1);
		ord:=(MAX DIV 2);
	END;
Procedure Remplissage(VAR tab:Tableau2dim; VAR x:INTEGER; VAR y:INTEGER);
	VAR
		i,j:INTEGER;
	BEGIN
		FOR i:=2 TO (MAX*MAX) DO
			BEGIN
				x:=x+1;
				y:=y-1;
				TestBordureDroite(x,y);
					IF (Test(tab,x,y)=FALSE) THEN
						BEGIN
							REPEAT
								TestBordureGauche(x,y)
							UNTIL (Test(tab,x,y)=TRUE);
						END;
							
				tab[x,y]:=i;
				clrscr;
				affichage(tab);
			END;
	END;
	VAR
		matrice:Tableau2dim;
		abscisse,ordonnee:INTEGER;
	
	BEGIN
		clrscr;
		Initialisation(matrice,abscisse,ordonnee);
		Remplissage(matrice,abscisse,ordonnee);
		readln;
	END.
 