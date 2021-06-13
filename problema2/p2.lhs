\subsection*{Problema 2}
Definir



Incrementa os denominaodes. O caso de paragem do d é 1 e o caso de paragem desta função dá 2 porque estamos a trabalhar
no padrão n+1, ou seja, quando fazemos 1 (caso paragem do d) + 1 dá 2 que corresponde ao caso de paragem do di.
Aqui estamos a somar 1 porque estamos no padrão n+1 porque é como se tivessemos a somar começando no 1 (sem ser no caso de paragem),
ou seja, 0+1 fica 1 por isso corresponde a 1 + numei.

\begin{code}
denominator_incrementer 0 = 2
denominator_incrementer (n + 1) = 1 + denominator_incrementer n
\end{code}

Denominador

\begin{code}
denominator 0 = 1
denominator (n + 1) = denominator_incrementer n * denominator n
\end{code}

Incrementa os numeradores sucessivos. O caso de paragem do nume é 1 e o caso de paragem desta função dá 3 porque estamos a trabalhar
no padrão n+1, ou seja, quando fazemos 1 (caso paragem do nume) + (1+1) dá 3 que corresponde ao caso de paragem do numei.
Aqui estamos a somar 2 porque estamos no padrão n+1 porque é como se tivessemos a somar começando no 1 (sem ser no caso de paragem),
ou seja, 1+1 fica 2 por isso corresponde a 2 + numei.

\begin{code}
numerator_incrementer 0 = 3
numerator_incrementer (n + 1) = 2 + numerator_incrementer n
\end{code}

Numerador

\begin{code}
numerator 0 = 1
numerator (n + 1) = numerator_incrementer n * numerator n
\end{code} 

Fração que corresponde ao quociente entre o numerador e o denominador

\begin{code}
quotient 0 = 1
quotient n = numerator n / denominator n
\end{code}  

Na primeira componente temos o quociente entre o numero e o denominador. 
Na segunda compoente temos o produto do numerador pelo seu numerador sucessivo + 1 pelo numerador sucessivo para obter o numerador pretendido.
Na terceira compoente temos o produto do denominador pelo seu denominadorsucessivo + 1 pelo denominador sucessivo para obter o 
numerador pretendido.
A quarta componente corresponde à função numei para incrementar os numeradores sucessivos.
A quinta componente corresponde à função a para incrementar os denominadores sucessivos.

\begin{code}
loop (quotient , numerator , denominator , numerator_incrementer , denominator_incrementer) = (div numerador denominator , numerator * (numerator_incrementer + 1) * numerator_incrementer , denominator * (denominator_incrementer + 1) * denominator_incrementer , numerator_incrementer + 2 , denominator_incrementer + 1)  
\end{code} 

Valores dos casos de paragem de cada uma das funções

\begin{code}
inic = (1 , 1 , 1 , 3 , 2)
\end{code} 

Função principal é a f

\begin{code}
prj (f , g , h , i , j) = f 
\end{code}  

por forma a que
\begin{code}
cat = prj . (for loop inic)
\end{code}
seja a função pretendida.
\textbf{NB}: usar divisão inteira.
Apresentar de seguida a justificação da solução encontrada.