\subsection*{Problema 3}
A resoluão da primeira alínea passar por adaptarmos o algoritmo fornecido a um catamorfismo.
Usando a função auxiliar g usada na função fornecida, basta criarmos um catamorfismo de listas
que aplica essa função auxiliar a listas não vazias e devolve a lista vazia para listas também vazias
(Ou seja, pontos de dimensão 0).

\begin{code}
g :: (Rational, NPoint -> OverTime NPoint) -> (NPoint -> OverTime NPoint)
g (d,f) l = case l of
  []      -> nil
  (x:xs)  -> \z -> concat $ (sequenceA [singl . linear1d d x, f xs]) z

calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine = cataList gene where
    gene = either (const (const nil)) g
    g :: (Rational, NPoint -> OverTime NPoint) -> (NPoint -> OverTime NPoint)
    g (d,f) l = case l of
      []      -> nil
      (x:xs)  -> \z -> concat $ (sequenceA [singl . linear1d d x, f xs]) z

\end{code}
Para a segunda alínea, decidimos utilizar um hilomorfismo de LTree. O anamorfismo
será responsável por, para listas de NPoints não vazias (sendo o caso da lista)
vazia tratada por pattern matchin na função deCasteljau), gerar uma LTree em que
o ramo da esquerda corresponde ao init da lista e o ramo da direita corresponde à
tail da lista.  

Este é o passo de "divide" do nosso hilomorfismo, em que dividimos a
lista de pontos até só termos um ponto em cada nodo. 

O nosso catamorfismo é assim a fase de conquer, em que resolvemos os problemas
que foram reduzidos no divide. Usamos a função auxiliar utilizada na função deCasteljau
fornecida para transformar os pontos nos pares de leafs das ltree, transformando gradualmente
a LTree num OverTime NPoint através do cálculo de baixo para cima das curvas.

\begin{code}
outNList :: [a] -> Either a (a, [a])
outNList [a]   = i1 a
outNList (a:x) = i2 (a,x)

deCasteljau :: [NPoint] -> OverTime NPoint
deCasteljau [] = nil
deCasteljau l = (hyloAlgForm alg coalg) l where
    coalg = ((id) -|- (split (init.cons) p2)) . outNList
    alg = either (const) (g_aux)
    g_aux :: (OverTime NPoint, OverTime NPoint) -> OverTime NPoint
    g_aux (ot1, ot2)= \pt -> (calcLine (ot1 pt) (ot2 pt)) pt

hyloAlgForm f g = (cataLTree f) . (anaLTree g)
\end{code}
