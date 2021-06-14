\subsection*{Problema 1} \label{pg:P1}
São dadas:
\begin{code}
cataExpAr g = g . recExpAr (cataExpAr g) . outExpAr
anaExpAr g = inExpAr . recExpAr (anaExpAr g) . g
hyloExpAr h g = cataExpAr h . anaExpAr g

eval_exp :: Floating a => a -> (ExpAr a) -> a
eval_exp a = cataExpAr (g_eval_exp a)

optmize_eval :: (Floating a, Eq a) => a -> (ExpAr a) -> a
optmize_eval a = hyloExpAr (gopt a) clean

sd :: Floating a => ExpAr a -> ExpAr a
sd = p2 . cataExpAr sd_gen

ad :: Floating a => a -> ExpAr a -> a
ad v = p2 . cataExpAr (ad_gen v)
\end{code}
Definir:

A função de out deste tipo deve receber uma ExpAr e fornecer os dados relevantes
identificando-os apropriadamente de acordo com a inExpAr já utilizada. 

Assim sendo, para expressões de variáveis (X), como não temos nenhum parâmetro, devolvemos 
apenas '()' identificado com Left. Todos os outros tipos de expressões serão então identificadas
Right e mais um  (ou dois para as expressões) identificador para os diferenciar entre eles.
\begin{code}
outExpAr X = i1 ()
outExpAr (N a) = i2 (i1 a)
outExpAr (Bin op ex1 ex2) = i2 (i2 (i1 (op, (ex1, ex2))))
outExpAr (Un op ex) = i2 (i2 (i2 (op, ex)))
\end{code}
---
A função recExpAr está responsável pela recursividade de um catamorfismo. Como tal,
faz sentido que ela aplique a função fornecida como argumento apenas às parte recursivas
das expressões, ou seja, à expressões que estejam dentro do tipo de dados criado pelo out.
Os casos em que temos expressões dentro do nosso tipo de dados são os casos das operações,
nos quais a outExpAr devolve  o (devidamente identificado) par de operação expressão/expressões.
Sendo assim, esta função tem de aplicar ao tipo de dados a função fornecida às expressões das possíveis
operações, deixando outros identificadores iguais (id). Usando a função baseExpAr, basta indicarmos
onde aplicar id e onde aplicar a função fornecida.
\begin{code}
recExpAr f = baseExpAr id id id f f id f
\end{code}
---
Num catamorfismo de ExpAr, o gene vai sempre receber o tipo 1 + (B + (C + D)), em que
o 1 corresponde a uma expressão de variável, B a uma constante (N 0, por exemplo), C a uma
operação binária e D a uma operação unária. Sendo assim, o nosso gene de eval
tem de devolver o float fornecido para variáveis, o próprio valor para constantes, e 
finalmente operar segundo as operações que encontrar (que definimos nas funções auxiliares)
do_bin e do_un.

\begin{code}
g_eval_exp a = either (const a) (either id do_ops) where
  do_ops = either do_bin do_un
  do_bin :: Num a => (BinOp, (a, a)) -> a
  do_bin (Sum, pair) = (uncurry (+)) pair
  do_bin (Product, pair) = (uncurry (*)) pair
  do_un :: Floating a => (UnOp, a) -> a
  do_un (Negate, x) = negate x
  do_un (E, x) = exp x
\end{code}
---
Para este hilomorfismo, o nosso anamorfismo vai tratar de limpar possíveis casos
de absorção nas operações das expressões fornecidas, sendo assim responsável pela
parte do algoritmo de otimização. O catamorfismo utilizado é o que definimos na alínea
anterior, sendo responsável por calcular o valor de uma expressão. 

\begin{code}
clean :: (Floating a, Eq a) => ExpAr a -> Either () (Either a (Either (BinOp, (ExpAr a, ExpAr a)) (UnOp, ExpAr a)))
clean = outExpAr . clean_aux where
  clean_aux :: (Floating a, Eq a) => ExpAr a -> ExpAr a
  clean_aux (Bin Product (N 0) _) = N 0
  clean_aux (Bin Product _ (N 0)) = N 0
  clean_aux (Un E (N 0)) = N 1
  clean_aux e = e
---
gopt a = g_eval_exp a

\end{code}

A função sd já implementada executa um catamorfismo que devolve um par e usa a função
p2 para usar apenas o segundo elemento do par. O par contém no elemento da esquerda
a expressão original e no elemento da direita a expressão derivada. Como tal, o nosso
gene terá de devolver esse par. Sendo assim, o nosso gene será um split. À esquerda do split
será trabalhado o tipo de dados para remover a informação relativa à derivada (Ou seja,
serão trabalhadas as expressões para que tenham apenas a informação relativa à expressão
original). Após esta tarefa, o tipo de dados passa pelo inExpAr e é transformado de volta numa
expressão. O lado direito do split fica então responsável por aplicar as leis da derivação
aos casos diferentes de expressões, utilizando onde necessária a informação relativa às expressões
originais ou às derivadas de expressões em operações calculadas recursivamente.
\begin{code}
sd_gen :: (Floating a) =>
    Either () (Either a (Either (BinOp, ((ExpAr a, ExpAr a), (ExpAr a, ExpAr a))) (UnOp, (ExpAr a, ExpAr a)))) -> (ExpAr a, ExpAr a)
sd_gen = split (inExpAr.og) (der) where
  og = id -|- (id -|- ((id >< (split (p1.p1) (p1.p2))) -|- (id >< p1)))
  --der = either (const (N 1)) (either (const (N 0)) der_aux)
  --der_aux = inExpAr . (either (i2.i2.i1.(id >< (split (p2.p1) (p2.p2)))) (i2.i2.i2.(id >< p2)))
der :: (Floating a) => Either () (Either a (Either (BinOp, ((ExpAr a, ExpAr a), (ExpAr a, ExpAr a))) (UnOp, (ExpAr a, ExpAr a)))) -> ExpAr a
der = either (inExpAr.i2.i1.(const 1)) (either (const (N 0)) (either bin_aux un_aux))
bin_aux :: (Floating a) => (BinOp, ((ExpAr a, ExpAr a), (ExpAr a, ExpAr a))) -> ExpAr a
bin_aux (Sum,((o1, d1),(o2, d2))) = (Bin Sum d1 d2)
bin_aux (Product,((o1, d1),(o2, d2))) = (Bin Sum (Bin Product o1 d2) (Bin Product d1 o2))
un_aux :: (Floating a) => (UnOp, (ExpAr a, ExpAr a)) -> ExpAr a
un_aux (E,(o, d)) = (Bin Product (Un E o) d)
un_aux (Negate, (o, d)) = (Un Negate d)
\end{code}


A função ad, tal como a sd, usa um catamorfismo que devolve um par e apenas
usa o segundo elemento do par. Este par contém na esquerda o valor da expressão
original e na direita o valor da expressão derivada. Como tal, o nosso gene vai ser um split
em que à esquerda trabalhamos com os valores calculados recursivamente para a expressão original,
e à direita aplicamos as leis da derivação relevantes para calcular a derivada usando valores
calculados recursivamente nas expressões de operações. As funções auxiliares x_ad trabalham
todas sobre um tipo de expressão, aplicando as leis da derivação relevantes para cada tipo.

\begin{code}
ad_gen :: Floating a => a -> Either () (Either a (Either (BinOp, ((a, a),(a,a))) (UnOp, (a,a)))) -> (a,a)
ad_gen v = either (var_ad v) (either const_ad (either bin_ad un_ad))
var_ad :: Floating a => a -> () -> (a, a)
var_ad v = split (const v) (const 1)
const_ad :: Floating a => a -> (a, a)
const_ad = split id (const 0)
bin_ad :: Floating a => (BinOp, ((a,a),(a,a))) -> (a,a)
bin_ad (Sum, ((o1, d1),(o2, d2))) = ((o1+o2), (d1+d2))
bin_ad (Product, ((o1, d1),(o2, d2))) = ((o1*o2), (o1*d2 + d1*o2))
un_ad :: Floating a => (UnOp, (a,a)) -> (a,a)
un_ad (Negate, (o, d)) = ((-o), (-d))
un_ad (E, (o, d)) = ((exp o), ((exp o) * d))

\end{code}
