Vim�UnDo� �J���U
�9/�9I ��V����k�h��   E           
                      a��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             a�J     �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�K     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�M     �          V       �          U    5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             a�N     �          V      #include <>5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�V     �         W       �         V    5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             a�\     �          W      #include <fndef __CONNECT__>5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�a     �          W      #include ifndef __CONNECT__>5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             a�e     �          W      #include ifndef __CONNECT__5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             a�h     �         W      #define 5�_�   	              
   W        ����                                                                                                                                                                                                                                                                                                                                                             a�l     �   W               �   W            5�_�   
                 J        ����                                                                                                                                                                                                                                                                                                                            J          V          V       a�v     �   I   J          /void playRound(matrixType ** M, int n, int m) {   	int player;   	player = rand()%2 + 1;   		int won;   	do {   		printMatrix(M, n, m);   		M = play(M, n, m, player);   		won = checkWin(M, n, m);   		player = player % 2 + 1 ;   	}while (won == 0);       $	printf("player %d has won\n", won);   }5�_�                    I        ����                                                                                                                                                                                                                                                                                                                            J          J          V       a�w     �   H   I           5�_�                       
    ����                                                                                                                                                                                                                                                                                                                            I          I          V       a�    �         J      #include "matrix.h"5�_�                           ����                                                                                                                                                                                                                                                                                                                            I          I          V       a�     �                 #ifndef __CONNECT__   #define __CONNECT__5�_�                   G        ����                                                                                                                                                                                                                                                                                                                            G          G          V       a�~     �   F   G              #endif5�_�                            ����                                                                                                                                                                                                                                                                                                                            G          G          V       a��     �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                            E          E          V       a��    �         D    5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        a��    �      
        5�_�                            ����                                                                                                                                                                                                                                                                                                                            H          H          V       a�     �         H    �         H      ?matrixType ** play(matrixType ** M, int n, int m, int player) {5��