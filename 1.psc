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
		
        Si ~ HayGanador y CantTurnos<9 Entonces
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
                        Pos <- 99;
                    SiNo
                        i <- trunc((Pos-1)/3) + 1
                        j <- ((Pos-1) MOD 3) + 1
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
				
                // Computadora elige una posición aleatoria
                Repetir
                    Pos <- Aleatorio(1, 9)
                    i <- trunc((Pos-1)/3) + 1
                    j <- ((Pos-1) MOD 3) + 1
                Hasta Que Tab1[i,j] = 0
                
                // guarda la ficha en la matriz tab2 y el valor en tab1
                Tab1[i,j] <- Valor
                Tab2[i,j] <- Ficha
            FinSi
            
            // verifica si ganó, buscando que el producto de las fichas en el tablero sea igual al objetivo
            aux_d1 <- 1; aux_d2 <- 1
            Para i <- 1 Hasta 3 Hacer
                aux_i <- 1; aux_j <- 1
                aux_d1 <- aux_d1 * Tab1[i,i]
                aux_d2 <- aux_d2 * Tab1[i,4-i]
                Para j <- 1 Hasta 3 Hacer
                    aux_i <- aux_i * Tab1[i,j]
                    aux_j <- aux_j * Tab1[j,i]
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
