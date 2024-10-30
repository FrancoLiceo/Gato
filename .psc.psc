Algoritmo TaTeTi
    Dimension Tab1[3,3]
    Dimension Tab2[3,3]
	
    Para i <- 1 Hasta 3 Hacer
        Para j <- 1 Hasta 3 Hacer
            Tab1[i,j] <- 0
            Tab2[i,j] <- " "
        FinPara
    FinPara
	
    Terminado <- Falso
    HayGanador <- Falso
    CantTurnos <- 0
	
    Mientras ~ Terminado hacer
        // dibuja el tablero
        Borrar Pantalla
        Escribir " "
        Escribir "      ||     ||     "
        Escribir "   ",Tab2[1,1],"  ||  ",Tab2[1,2],"  ||  ",Tab2[1,3]
        Escribir "     1||    2||    3"
        Escribir " =====++=====++======"
        Escribir "      ||     ||     "
        Escribir "   ",Tab2[2,1],"  ||  ",Tab2[2,2],"  ||  ",Tab2[2,3]
        Escribir "     4||    5||    6"
        Escribir " =====++=====++======"
        Escribir "      ||     ||     "
        Escribir "   ",Tab2[3,1],"  ||  ",Tab2[3,2],"  ||  ",Tab2[3,3]
        Escribir "     7||    8||    9"
        Escribir " "
		
        Si ~ HayGanador y CantTurnos < 9 Entonces
            // carga auxiliares según a qué jugador le toca
            CantTurnos <- CantTurnos + 1
            Si CantTurnos % 2 = 1 Entonces
                Ficha <- 'X'; Valor <- 1; Objetivo <- 1
                Escribir "Turno del jugador 1 (X)"
                // pide la posición para colocar la ficha y la valida
                Escribir "Ingrese la Posición (1-9):"
                
                Repetir
                    Leer Pos
                    Si Pos < 1 o Pos > 9 Entonces
                        Escribir "Posición incorrecta, ingrese nuevamente: "
                        Pos <- 99
                    SiNo
                        i <- trunc((Pos - 1) / 3) + 1
                        j <- ((Pos - 1) MOD 3) + 1
                        Si Tab1[i,j] <> 0 Entonces
                            Pos <- 99
                            Escribir "Posición incorrecta, ingrese nuevamente: "
                        FinSi
                    FinSi
                Hasta Que Pos <> 99
                // guarda la ficha en la matriz tab2 y el valor en tab1
                Tab1[i,j] <- Valor
                Tab2[i,j] <- Ficha
            SiNo
                // Turno de la computadora
                Ficha <- 'O'; Valor <- 2; Objetivo <- 8
                Escribir "Turno del jugador 2 (O) - Computadora"
                
                // Lógica para que la computadora juegue
                Ganar <- Falso
                Para i <- 1 Hasta 3 Hacer
                    Para j <- 1 Hasta 3 Hacer
                        Si Tab1[i,j] = 0 Entonces
                            Tab1[i,j] <- Valor
                            Si VerificarGanador(Tab1, Valor) Entonces
                                Ganar <- Verdadero
                                Pos <- (i - 1) * 3 + j
                                Salir
                            FinSi
                            Tab1[i,j] <- 0
                        FinSi
                    FinPara
                    Si Ganar Entonces Salir
					FinPara
					
					// Si no puede ganar, bloquear al jugador
					Si ~Ganar Entonces
						Para i <- 1 Hasta 3 Hacer
							Para j <- 1 Hasta 3 Hacer
								Si Tab1[i,j] = 0 Entonces
									Tab1[i,j] <- 1
									Si VerificarGanador(Tab1, 1) Entonces
										Pos <- (i - 1) * 3 + j
										Tab1[i,j] <- Valor
										Ganar <- Verdadero
										Salir
									FinSi
									Tab1[i,j] <- 0
								FinSi
							FinPara
							Si Ganar Entonces Salir
							FinPara
						FinSi
						
						// Si no puede ganar ni bloquear, elige una posición aleatoria
						Si ~Ganar Entonces
							Repetir
								Pos <- Aleatorio(1, 9)
								i <- trunc((Pos - 1) / 3) + 1
								j <- ((Pos - 1) MOD 3) + 1
							Hasta Que Tab1[i,j] = 0
						FinSi
						
						// guarda la ficha en la matriz tab2 y el valor en tab1
						Tab1[i,j] <- Valor
						Tab2[i,j] <- Ficha
					FinSi
					
					// verifica si ganó
					HayGanador <- Falso
					aux_d1 <- 1; aux_d2 <- 1
					Para x <- 1 Hasta 3 Hacer
						aux_i <- 1; aux_j <- 1
						aux_d1 <- aux_d1 * Tab1[x,x]
						aux_d2 <- aux_d2 * Tab1[x,4-x]
						Para y <- 1 Hasta 3 Hacer
							aux_i <- aux_i * Tab1[x,y]
							aux_j <- aux_j * Tab1[y,x]
						FinPara
						Si aux_i = Objetivo o aux_j = Objetivo Entonces
							HayGanador <- Verdadero
						FinSi
					FinPara
					Si aux_d1 = Objetivo o aux_d2 = Objetivo Entonces
						HayGanador <- Verdadero
					FinSi
					
				SiNo
					Si HayGanador Entonces
						Escribir "Hay ganador: " sin saltar
						Si CantTurnos % 2 = 1 Entonces
							Escribir "Jugador 1!"
						SiNo
							Escribir "Computadora (Jugador 2)!"
						FinSi
					SiNo
						Escribir "Empate!"
					FinSi
					Terminado <- Verdadero
				FinSi
				
			FinMientras
FinAlgoritmo

