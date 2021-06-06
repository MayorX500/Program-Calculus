\subsection*{Problema 4}

Solução para listas não vazias:

Para a resolução da primeira alínea, resolvemos o problema utilizando a lei da recursividade mútua (\textit{Fokkinga}). Assim sendo, desenvolvemos da seguinte forma:

|avg_aux = <avg, len>|

Logo, introduzindo o catamorfismo...
\begin{eqnarray*}
\start
  |<avg, len> = cata (split h k)|
%
\just\equiv{ Lei Fokkinga, F f = id + id x f para listas }
%
          |lcbr(
      avg . in = h . (id + id x <avg, len>)
    )(
      len . in = k . (id + id x <avg, len>)
    )|
%
\end{eqnarray*}
Desenvolvendo o sistema, separando o h e o k em h1 e h2, k1 e k2, e introduzindo variáveis, ficamos com as seguintes equações:
\begin{eqnarray*}
\start
          |lcbr(
      lcbr(
  avg [] = 0
      )(
  avg (a:as) = (a + (avg as * len as)) / (len as + 1)
      ))(
      lcbr(
  len [] = 0
      )(
  len (a:as) = 1 + len as
      ))|
\end{eqnarray*}
Finalmente removemos as variáveis novamente e definimos a nossa implementação efetiva em haskell.
\begin{eqnarray*}
\start
          |lcbr(
        lcbr(
  avg . nil  = const 0
        )(
  avg . cons = mydiv . <myadd.<p1 (mymul.p2)> k2>
        ))(
        lcbr(
  len . nil = const 0
        )(
  len . cons = succ . p2 . p2
        ))|
\end{eqnarray*}
Em que definimos, pela seguinte ordem, h1, h2, k1, e k2. Usando a lei da troca, chegamos ao formato pedido no enunciado.
\begin{eqnarray*}
\start
|<avg, len> = cata (<[h1, h2], [h1, h2]>)|
%
\just\equiv{ Lei da troca}
%
|<avg, len> = cata [<h1, k1>, <h2, k2>]|
%
\just\equiv{ Definições de h e k }
%
|<avg, len> = cata [<const 0, const 0>, <mydiv.<myadd.<p1, (mymul.p2)>, k2>, succ.p2.p2>]|
\end{eqnarray*}
E finalmente chegamos à solução da alínea. São definidas e utilizadas as funções mydiv, etc devido a problemas com o interpretador no uso das funções já definidas nos módulos fornecidos.
\begin{code}
avg = p1.avg_aux
\end{code}

\begin{code}
mydiv = (uncurry (/))
myadd = (uncurry (+))
mymul = (uncurry (*)) 

avg_aux = cataList (either (split (const 0) (const 0)) (split h2 k2)) where
    k2 = succ.p2.p2
    h2 = mydiv . (split (myadd.(split p1 (mymul.p2))) k2)
\end{code}
Solução para árvores de tipo \LTree:

Para este caso olhamos para o diagrama do catamorfismo em questão. Esta alínea passa por adaptar o nosso gene ao catamorfismo da LTree.


\xymatrix@@C=2cm{
    |LTree(Nat0)|
           \ar[d]_-{|cataNat gene|}
&
    |Nat0 + LTree(Nat0) >< LTree(Nat0)|
           \ar[d]^{|id + (cata gene) >< (cata gene)|}
           \ar[l]_-{|in|}
\\
     |(A, A)|
&
     |Nat0 + (A, A) >< (A, A)|
           \ar[l]^-{|gene = [<h1, k1>, <h2, k2>]|}
}

Definimos então h1 e k1 como a média e comprimento de uma Leaf e h2 e k2 como média e comprimento de um Fork, que são definições facilmente implementadas em haskell.
\begin{code}
avgLTree = p1.cataLTree gene where
    k2 = myadd . (split (p2.p1) (p2.p2))
    h2 = mydiv . (split (myadd . (split (mymul.p1) (mymul.p2))) k2)
    gene = either (split id (const 1)) (split h2 k2)
\end{code}
