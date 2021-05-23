\subsection*{Problema 2}
Definir
\begin{code}

{-
Incrementa os denominaodes. O caso de paragem do d é 1 e o caso de paragem desta função dá 2 porque estamos a trabalhar
no padrão n+1, ou seja, quando fazemos 1 (caso paragem do d) + 1 dá 2 que corresponde ao caso de paragem do di.
Aqui estamos a somar 1 porque estamos no padrão n+1 porque é como se tivessemos a somar começando no 1 (sem ser no caso de paragem),
ou seja, 0+1 fica 1 por isso corresponde a 1 + numei.
-}
di 0 = 2
di (n + 1) = 1 + di n


-- Denominador
d 0 = 1
d (n + 1) = di n * d n

{- Incrementa os numeradores sucessivos. O caso de paragem do nume é 1 e o caso de paragem desta função dá 3 porque estamos a trabalhar
no padrão n+1, ou seja, quando fazemos 1 (caso paragem do nume) + (1+1) dá 3 que corresponde ao caso de paragem do numei.
Aqui estamos a somar 2 porque estamos no padrão n+1 porque é como se tivessemos a somar começando no 1 (sem ser no caso de paragem),
ou seja, 1+1 fica 2 por isso corresponde a 2 + numei.
-}
numei 0 = 3
numei (n + 1) = 2 + numei n

-- Numerador
nume 0 = 1
nume (n + 1) = numei n * nume n 

-- Fração que corresponde ao quociente entre o numerador e o denominador
t 0 = 1
t n = nume n / d n 

{- Na primeira componente temos o quociente entre o numero e o denominador. 
Na segunda compoente temos o produto do numerador pelo seu numerador sucessivo + 1 pelo numerador sucessivo para obter o numerador pretendido.
Na terceira compoente temos o produto do denominador pelo seu denominadorsucessivo + 1 pelo denominador sucessivo para obter o 
numerador pretendido.
A quarta componente corresponde à função numei para incrementar os numeradores sucessivos.
A quinta componente corresponde à função a para incrementar os denominadores sucessivos.
-}
loop (t , nume , d , numei , di) = (div nume d , nume * (numei + 1) * numei , d * (di + 1) * di , numei + 2 , di + 1)  

-- Valores dos casos de paragem de cada uma das funções
inic = (1 , 1 , 1 , 3 , 2)

-- Função principal é a f
prj (f , g , h , i , j) = f  

\end{code}
por forma a que
\begin{code}
cat = prj . (for loop inic)
\end{code}
seja a função pretendida.
\textbf{NB}: usar divisão inteira.
Apresentar de seguida a justificação da solução encontrada.