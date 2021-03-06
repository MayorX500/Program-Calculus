\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp2021t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
\definecolor{red}{RGB}{255,  0,  0}
\definecolor{blue}{RGB}{0,0,255}
\def\red{\color{red}}
\def\blue{\color{blue}}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp2021t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format .=?=. = "\mathbin{\stackrel{\mathrm{?}}{=}}"
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format <$> = "\mathbin{\mathopen{\langle}\$\mathclose{\rangle}}"
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (cata (f)) = "\cata{" f "}"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format Rational = "\Q "
%format toRational = " to_\Q "
%format fromRational = " from_\Q "
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "
%format (curry (f)) = "\overline{" f "}"
%format (cataLTree (x)) = "\llparenthesis\, " x "\,\rrparenthesis"
%format (anaLTree (x)) = "\mathopen{[\!(}" x "\mathclose{)\!]}"
%format delta = "\Delta "

%---------------------------------------------------------------------------

\title{
       	C??lculo de Programas
\\
       	Trabalho Pr??tico
\\
       	MiEI+LCC --- 2020/21
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 28
\\\hline
a93220 & Alexandre Flores	
\\
a93294 & Miguel Gomes	
\\
a90468 & Rui Armada 
\\
a67674 & Tiago Sousa	
\end{tabular}
\end{center}

\section{Pre??mbulo}

\CP\ tem como objectivo principal ensinar
a progra\-ma????o de computadores como uma disciplina cient??fica. Para isso
parte-se de um repert??rio de \emph{combinadores} que formam uma ??lgebra da
programa????o (conjunto de leis universais e seus corol??rios) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto ??,
agregando programas j?? existentes.
  
Na sequ??ncia pedag??gica dos planos de estudo dos dois cursos que t??m
esta disciplina, opta-se pela aplica????o deste m??todo ?? programa????o
em \Haskell\ (sem preju??zo da sua aplica????o a outras linguagens 
funcionais). Assim, o presente trabalho pr??tico coloca os
alunos perante problemas concretos que dever??o ser implementados em
\Haskell.  H?? ainda um outro objectivo: o de ensinar a documentar
programas, a valid??-los e a produzir textos t??cnico-cient??ficos de
qualidade.

\section{Documenta????o} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma t??cnica de programa\-????o dita
``\litp{liter??ria}'' \cite{Kn92}, cujo princ??pio base ?? o seguinte:
%
\begin{quote}\em Um programa e a sua documenta????o devem coincidir.
\end{quote}
%
Por outras palavras, o c??digo fonte e a documenta????o de um
programa dever??o estar no mesmo ficheiro.

O ficheiro \texttt{cp2021t.pdf} que est?? a ler ?? j?? um exemplo de
\litp{programa????o liter??ria}: foi gerado a partir do texto fonte
\texttt{cp2021t.lhs}\footnote{O suffixo `lhs' quer dizer
\emph{\lhaskell{literate Haskell}}.} que encontrar?? no
\MaterialPedagogico\ desta disciplina descompactando o ficheiro
\texttt{cp2021t.zip} e executando:
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp2021t.lhs > cp2021t.tex
    $ pdflatex cp2021t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} ??
um pre-processador que faz ``pretty printing''
de c??digo Haskell em \Latex\ e que deve desde j?? instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex --lib
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp2021t.lhs} ?? execut??vel e cont??m
o ``kit'' b??sico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp2021t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
module Main where 
import Cp
import List hiding (fac)
import Nat
import LTree
import Data.List hiding (find)
import Test.QuickCheck hiding ((><),choose,collect)
import qualified Test.QuickCheck as QuickCheck
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Control.Monad
import Control.Applicative hiding ((<|>))
import System.Process
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp2021t.lhs} no seu editor de texto preferido
e verifique que assim ??: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
?? seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho te??rico-pr??tico deve ser realizado por grupos de 3 (ou 4) alunos.
Os detalhes da avalia????o (datas para submiss??o do relat??rio e sua defesa
oral) s??o os que forem publicados na \cp{p??gina da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder ??s quest??es que ser??o colocadas
na \emph{defesa oral} do relat??rio.

Em que consiste, ent??o, o \emph{relat??rio} a que se refere o par??grafo anterior?
?? a edi????o do texto que est?? a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relat??rio dever?? conter ainda a identifica????o dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relat??rio deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o ??ndice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp2021t.aux
    $ makeindex cp2021t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-?? ainda instalar o utilit??rio
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
gera????o de gr??ficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss --lib
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invoc??-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}
Pode-se ainda controlar o n??mero de casos de teste e sua complexidade,
como o seguinte exemplo mostra:
\begin{verbatim}
    > quickCheckWith stdArgs { maxSuccess = 200, maxSize = 10 } prop
    +++ OK, passed 200 tests.
\end{verbatim}
Qualquer programador tem, na vida real, de ler e analisar (muito!) c??digo
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
c??digo \Haskell\ relativo aos problemas que se seguem. Esse anexo dever??
ser consultado e analisado ?? medida que isso for necess??rio.

\subsection{Stack}

O \stack{Stack} ?? um programa ??til para criar, gerir e manter projetos em \Haskell.
Um projeto criado com o Stack possui uma estrutura de pastas muito espec??fica:

\begin{itemize}
\item Os m??dulos auxiliares encontram-se na pasta \emph{src}.
\item O m??dulos principal encontra-se na pasta \emph{app}.
\item A lista de dep??ndencias externas encontra-se no ficheiro \emph{package.yaml}.
\end{itemize}

Pode aceder ao \GHCi\ utilizando o comando:
\begin{verbatim}
stack ghci
\end{verbatim}

Garanta que se encontra na pasta mais externa \textbf{do projeto}.
A primeira vez que correr este comando as dep??ndencias externas ser??o instaladas automaticamente.

Para gerar o PDF, garanta que se encontra na diretoria \emph{app}.

\Problema

Os \emph{tipos de dados alg??bricos} estudados ao longo desta disciplina oferecem
uma grande capacidade expressiva ao programador. Gra??as ?? sua flexibilidade,
torna-se trivial implementar \DSL s
e at?? mesmo \href{http://www.cse.chalmers.se/~ulfn/papers/thesis.pdf}{linguagens de programa????o}.

Paralelamente, um t??pico bastante estudado no ??mbito de \DL\ 
?? a deriva????o autom??tica de express??es matem??ticas, por exemplo, de derivadas.
Duas t??cnicas que podem ser utilizadas para o c??lculo de derivadas s??o:

\begin{itemize}
\item \emph{Symbolic differentiation}
\item \emph{Automatic differentiation}
\end{itemize}

\emph{Symbolic differentiation} consiste na aplica????o sucessiva de transforma????es
(leia-se: fun????es) que sejam congruentes com as regras de deriva????o. O resultado
final ser?? a express??o da derivada.

O leitor atento poder?? notar um problema desta t??cnica: a express??o
inicial pode crescer de forma descontrolada, levando a um c??lculo pouco eficiente.
\emph{Automatic differentiation} tenta resolver este problema,
calculando \textbf{o valor} da derivada da express??o em todos os passos.
Para tal, ?? necess??rio calcular o valor da express??o \textbf{e} o valor da sua derivada.

Vamos de seguida definir uma linguagem de express??es matem??ticas simples e
implementar as duas t??cnicas de deriva????o autom??tica.
Para isso, seja dado o seguinte tipo de dados,

\begin{code}
data ExpAr a = X
           | N a
           | Bin BinOp (ExpAr a) (ExpAr a)
           | Un UnOp (ExpAr a)
           deriving (Eq, Show)
\end{code}

\noindent
onde |BinOp| e |UnOp| representam opera????es bin??rias e un??rias, respectivamente:

\begin{code}
data BinOp = Sum
           | Product
           deriving (Eq, Show)

data UnOp = Negate
          | E
          deriving (Eq, Show)
\end{code}

\noindent
O construtor |E| simboliza o exponencial de base $e$.

Assim, cada express??o pode ser uma vari??vel, um n??mero, uma opera????o bin??ria
aplicada ??s devidas express??es, ou uma opera????o un??ria aplicada a uma express??o.
Por exemplo,
\begin{spec}
Bin Sum X (N 10)
\end{spec}
designa |x+10| na nota????o matem??tica habitual.

\begin{enumerate}
\item A defini????o das fun????es |inExpAr| e |baseExpAr| para este tipo ?? a seguinte:
\begin{code}
inExpAr = either (const X) num_ops where
  num_ops = either N ops
  ops     = either bin (uncurry Un)
  bin(op, (a, b)) = Bin op a b

baseExpAr f g h j k l z = f -|- (g -|- (h >< (j >< k) -|- l >< z))
\end{code}

  Defina as fun????es |outExpAr| e |recExpAr|,
  e teste as propriedades que se seguem.
  \begin{propriedade}
    |inExpAr| e |outExpAr| s??o testemunhas de um isomorfismo,
    isto ??,
    |inExpAr . outExpAr = id| e |outExpAr . idExpAr = id|:
\begin{code}
prop_in_out_idExpAr :: (Eq a) => ExpAr a -> Bool
prop_in_out_idExpAr = inExpAr . outExpAr .==. id

prop_out_in_idExpAr :: (Eq a) => OutExpAr a -> Bool
prop_out_in_idExpAr = outExpAr . inExpAr .==. id
\end{code}
    \end{propriedade}

  \item Dada uma express??o aritm??tica e um escalar para substituir o |X|,
	a fun????o

\begin{quote}
      |eval_exp :: Floating a => a -> (ExpAr a) -> a|
\end{quote}

\noindent calcula o resultado da express??o. Na p??gina \pageref{pg:P1}
    esta fun????o est?? expressa como um catamorfismo. Defina o respectivo gene
    e, de seguida, teste as propriedades:
    \begin{propriedade}
       A fun????o |eval_exp| respeita os elementos neutros das opera????es.
\begin{code}
prop_sum_idr :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_sum_idr a exp = eval_exp a exp .=?=. sum_idr where
  sum_idr = eval_exp a (Bin Sum exp (N 0))

prop_sum_idl :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_sum_idl a exp = eval_exp a exp .=?=. sum_idl where
  sum_idl = eval_exp a (Bin Sum (N 0) exp)

prop_product_idr :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_product_idr a exp = eval_exp a exp .=?=. prod_idr where
  prod_idr = eval_exp a (Bin Product exp (N 1))

prop_product_idl :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_product_idl a exp = eval_exp a exp .=?=. prod_idl where
  prod_idl = eval_exp a (Bin Product (N 1) exp)

prop_e_id :: (Floating a, Real a) => a -> Bool
prop_e_id a = eval_exp a (Un E (N 1)) == expd 1

prop_negate_id :: (Floating a, Real a) => a -> Bool
prop_negate_id a = eval_exp a (Un Negate (N 0)) == 0
\end{code}
    \end{propriedade}
    \begin{propriedade}
      Negar duas vezes uma express??o tem o mesmo valor que n??o fazer nada.
\begin{code}
prop_double_negate :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_double_negate a exp = eval_exp a exp .=?=. eval_exp a (Un Negate (Un Negate exp))
\end{code}
    \end{propriedade}

  \item ?? poss??vel otimizar o c??lculo do valor de uma express??o aritm??tica tirando proveito
  dos elementos absorventes de cada opera????o. Implemente os genes da fun????o
\begin{spec}
      optmize_eval :: (Floating a, Eq a) => a -> (ExpAr a) -> a
\end{spec}
  que se encontra na p??gina \pageref{pg:P1} expressa como um hilomorfismo\footnote{Qual ?? a vantagem de implementar a fun????o |optimize_eval| utilizando um hilomorfismo em vez de utilizar um catamorfismo com um gene "inteligente"?}
  e teste as propriedades:

    \begin{propriedade}
      A fun????o |optimize_eval| respeita a sem??ntica da fun????o |eval|.
\begin{code}
prop_optimize_respects_semantics :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_optimize_respects_semantics a exp = eval_exp a exp .=?=. optmize_eval a exp
\end{code}
    \end{propriedade}


\item Para calcular a derivada de uma express??o, ?? necess??rio aplicar transforma????es
?? express??o original que respeitem as regras das derivadas:\footnote{%
	Apesar da adi????o e multiplica????o gozarem da propriedade comutativa,
	h?? que ter em aten????o a ordem das opera????es por causa dos testes.}

\begin{itemize}
  \item Regra da soma:
\begin{eqnarray*}
	\frac{d}{dx}(f(x)+g(x))=\frac{d}{dx}(f(x))+\frac{d}{dx}(g(x))
\end{eqnarray*}
  \item Regra do produto:
\begin{eqnarray*}
	\frac{d}{dx}(f(x)g(x))=f(x)\cdot \frac{d}{dx}(g(x))+\frac{d}{dx}(f(x))\cdot g(x)
\end{eqnarray*}
\end{itemize}

  Defina o gene do catamorfismo que ocorre na fun????o
    \begin{quote}
      |sd :: Floating a => ExpAr a -> ExpAr a|
    \end{quote}
  que, dada uma express??o aritm??tica, calcula a sua derivada.
  Testes a fazer, de seguida:
    \begin{propriedade}
       A fun????o |sd| respeita as regras de deriva????o.
\begin{code}
prop_const_rule :: (Real a, Floating a) => a -> Bool
prop_const_rule a = sd (N a) == N 0

prop_var_rule :: Bool
prop_var_rule = sd X == N 1

prop_sum_rule :: (Real a, Floating a) => ExpAr a -> ExpAr a -> Bool
prop_sum_rule exp1 exp2 = sd (Bin Sum exp1 exp2) == sum_rule where
  sum_rule = Bin Sum (sd exp1) (sd exp2)

prop_product_rule :: (Real a, Floating a) => ExpAr a -> ExpAr a -> Bool
prop_product_rule exp1 exp2 = sd (Bin Product exp1 exp2) == prod_rule where
  prod_rule =Bin Sum (Bin Product exp1 (sd exp2)) (Bin Product (sd exp1) exp2)

prop_e_rule :: (Real a, Floating a) => ExpAr a -> Bool
prop_e_rule exp = sd (Un E exp) == Bin Product (Un E exp) (sd exp)

prop_negate_rule :: (Real a, Floating a) => ExpAr a -> Bool
prop_negate_rule exp = sd (Un Negate exp) == Un Negate (sd exp)
\end{code}
    \end{propriedade}

\item Como foi visto, \emph{Symbolic differentiation} n??o ?? a t??cnica
mais eficaz para o c??lculo do valor da derivada de uma express??o.
\emph{Automatic differentiation} resolve este problema c??lculando o valor
da derivada em vez de manipular a express??o original.

  Defina o gene do catamorfismo que ocorre na fun????o
    \begin{spec}
    ad :: Floating a => a -> ExpAr a -> a
    \end{spec}
  que, dada uma express??o aritm??tica e um ponto,
  calcula o valor da sua derivada nesse ponto,
  sem transformar manipular a express??o original.
  Testes a fazer, de seguida:

    \begin{propriedade}
       Calcular o valor da derivada num ponto |r| via |ad| ?? equivalente a calcular a derivada da express??o e avalia-la no ponto |r|.
\begin{code}
prop_congruent :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_congruent a exp = ad a exp .=?=. eval_exp a (sd exp)
\end{code}
    \end{propriedade}
\end{enumerate}

\Problema

Nesta disciplina estudou-se como fazer \pd{programa????o din??mica} por c??lculo,
recorrendo ?? lei de recursividade m??tua.\footnote{Lei (\ref{eq:fokkinga})
em \cite{Ol18}, p??gina \pageref{eq:fokkinga}.}

Para o caso de fun????es sobre os n??meros naturais (|Nat0|, com functor |fF
X = 1 + X|) ?? f??cil derivar-se da lei que foi estudada uma
	\emph{regra de algibeira}
	\label{pg:regra}
que se pode ensinar a programadores que n??o tenham estudado
\cp{C??lculo de Programas}. Apresenta-se de seguida essa regra, tomando como exemplo o
c??lculo do ciclo-\textsf{for} que implementa a fun????o de Fibonacci, recordar
o sistema
\begin{spec}
fib 0 = 1
fib(n+1) = f n

f 0 = 1
f (n+1) = fib n + f n
\end{spec}
Obter-se-?? de imediato
\begin{code}
fib' = p1 . for loop init where
   loop(fib,f)=(f,fib+f)
   init = (1,1)
\end{code}
usando as regras seguintes:
\begin{itemize}
\item	O corpo do ciclo |loop| ter?? tantos argumentos quanto o n??mero de fun????es mutuamente recursivas.
\item	Para as vari??veis escolhem-se os pr??prios nomes das fun????es, pela ordem
que se achar conveniente.\footnote{Podem obviamente usar-se outros s??mbolos, mas numa primeira leitura
d?? jeito usarem-se tais nomes.}
\item	Para os resultados v??o-se buscar as express??es respectivas, retirando a vari??vel |n|.
\item	Em |init| coleccionam-se os resultados dos casos de base das fun????es, pela mesma ordem.
\end{itemize}
Mais um exemplo, envolvendo polin??mios do segundo grau $ax^2 + b x + c$ em |Nat0|.
Seguindo o m??todo estudado nas aulas\footnote{Sec????o 3.17 de \cite{Ol18} e t??pico
\href{https://www4.di.uminho.pt/~jno/media/cp/}{Recursividade m??tua} nos v??deos das aulas te??ricas.},
de $f\ x = a x^2 + b x + c$ derivam-se duas fun????es mutuamente recursivas:
\begin{spec}
f 0 = c
f (n+1) = f n + k n

k 0 = a + b
k(n+1) = k n + 2 a
\end{spec}
Seguindo a regra acima, calcula-se de imediato a seguinte implementa????o, em Haskell:
\begin{code}
f' a b c = p1 . for loop init where
  loop(f,k) = (f+k,k+2*a)
  init = (c,a+b) 
\end{code}
O que se pede ent??o, nesta pergunta?
Dada a f??rmula que d?? o |n|-??simo \catalan{n??mero de Catalan},
\begin{eqnarray}
	C_n = \frac{(2n)!}{(n+1)! (n!) }
	\label{eq:cat}
\end{eqnarray}
derivar uma implementa????o de $C_n$ que n??o calcule factoriais nenhuns.
Isto ??, derivar um ciclo-\textsf{for}
\begin{spec}
cat = cdots . for loop init where cdots
\end{spec}
que implemente esta fun????o.

\begin{propriedade}
A fun????o proposta coincidem com a defini????o dada:
\begin{code}
prop_cat = (>=0) .==>. (catdef  .==. cat)
\end{code}
\end{propriedade}
%
\textbf{Sugest??o}: Come??ar por estudar muito bem o processo de c??lculo dado
no anexo \ref{sec:recmul} para o problema (semelhante) da fun????o exponencial.


\Problema 

As \bezier{curvas de B??zier}, designa????o dada em honra ao engenheiro
\href{https://en.wikipedia.org/wiki/Pierre_B%C3%A9zier}{Pierre B??zier},
s??o curvas ub??quas na ??rea de computa????o gr??fica, anima????o e modela????o.
Uma curva de B??zier ?? uma curva param??trica, definida por um conjunto
$\{P_0,...,P_N\}$ de pontos de controlo, onde $N$ ?? a ordem da curva.

\begin{figure}[h!]
  \centering
  \includegraphics[width=0.8\textwidth]{cp2021t_media/Bezier_curves.png}
  \caption{Exemplos de curvas de B??zier retirados da \bezier{ Wikipedia}.}
\end{figure}

O algoritmo de \emph{De Casteljau} ?? um m??todo recursivo capaz de calcular
curvas de B??zier num ponto. Apesar de ser mais lento do que outras abordagens,
este algoritmo ?? numericamente mais est??vel, trocando velocidade por corre????o.

De forma sucinta, o valor de uma curva de B??zier de um s?? ponto $\{P_0\}$
(ordem $0$) ?? o pr??prio ponto $P_0$. O valor de uma curva de B??zier de ordem
$N$ ?? calculado atrav??s da interpola????o linear da curva de B??zier dos primeiros
$N-1$ pontos e da curva de B??zier dos ??ltimos $N-1$ pontos.

A interpola????o linear entre 2 n??meros, no intervalo $[0, 1]$, ?? dada pela
seguinte fun????o:

\begin{code}
linear1d :: Rational -> Rational -> OverTime Rational
linear1d a b = formula a b where
  formula :: Rational -> Rational -> Float -> Rational
  formula x y t = ((1.0 :: Rational) - (toRational t)) * x + (toRational t) * y
\end{code}
%
A interpola????o linear entre 2 pontos de dimens??o $N$ ?? calculada atrav??s
da interpola????o linear de cada dimens??o.

O tipo de dados |NPoint| representa um ponto com $N$ dimens??es.
\begin{code}
type NPoint = [Rational]
\end{code}
Por exemplo, um ponto de 2 dimens??es e um ponto de 3 dimens??es podem ser
representados, respetivamente, por:
\begin{spec}
p2d = [1.2, 3.4]
p3d = [0.2, 10.3, 2.4]
\end{spec}
%
O tipo de dados |OverTime a| representa um termo do tipo |a| num dado instante
(dado por um |Float|).
\begin{code}
type OverTime a = Float -> a
\end{code}
%
O anexo \ref{sec:codigo} tem definida a fun????o 
    \begin{spec}
    calcLine :: NPoint -> (NPoint -> OverTime NPoint)
    \end{spec}
que calcula a interpola????o linear entre 2 pontos, e a fun????o
    \begin{spec}
    deCasteljau :: [NPoint] -> OverTime NPoint
    \end{spec}
que implementa o algoritmo respectivo.

\begin{enumerate}

\item Implemente |calcLine| como um catamorfismo de listas,
testando a sua defini????o com a propriedade:
    \begin{propriedade} Defini????o alternativa.
\begin{code}
prop_calcLine_def :: NPoint -> NPoint -> Float -> Bool
prop_calcLine_def p q d = calcLine p q d ==  zipWithM linear1d p q d
\end{code}
    \end{propriedade}

\item Implemente a fun????o |deCasteljau| como um hilomorfismo, testando agora a propriedade:
    \begin{propriedade}
      Curvas de B??zier s??o sim??tricas.
\begin{code}
prop_bezier_sym :: [[Rational]] -> Gen Bool
prop_bezier_sym l = all (< delta) . calc_difs . bezs <$> elements ps  where
  calc_difs = (\(x, y) -> zipWith (\w v -> if w >= v then w - v else v - w) x y)
  bezs t    = (deCasteljau l t, deCasteljau (reverse l) (fromRational (1 - (toRational t))))
  delta = 1e-2
\end{code}
    \end{propriedade}

  \item Corra a fun????o |runBezier| e aprecie o seu trabalho\footnote{%
        A representa????o em Gloss ?? uma adapta????o de um
        \href{https://github.com/hrldcpr/Bezier.hs}{projeto}
        de Harold Cooper.} clicando na janela que ?? aberta (que cont??m, a verde, um ponto
        inicila) com o bot??o esquerdo do rato para adicionar mais pontos.
        A tecla |Delete| apaga o ponto mais recente.

\end{enumerate}

\Problema

Seja dada a f??rmula que calcula a m??dia de uma lista n??o vazia $x$,
\begin{equation}
avg\ x = \frac 1 k\sum_{i=1}^{k} x_i
\end{equation}
onde $k=length\ x$. Isto ??, para sabermos a m??dia de uma lista precisamos de dois catamorfismos: o que faz o somat??rio e o que calcula o comprimento a lista.
Contudo, ?? facil de ver que
\begin{quote}
	$avg\ [a]=a$
\\
	$avg (a:x) = \frac 1 {k+1}(a+\sum_{i=1}^{k} x_i) = \frac{a+k(avg\ x)}{k+1}$ para $k=length\ x$
\end{quote}
Logo $avg$ est?? em recursividade m??tua com $length$ e o par de fun????es pode ser expresso por um ??nico catamorfismo, significando que a lista apenas ?? percorrida uma vez.

\begin{enumerate}

\item	Recorra ?? lei de recursividade m??tua para derivar a fun????o
|avg_aux = cata (either b q)| tal que 
|avg_aux = split avg length| em listas n??o vazias. 

\item	Generalize o racioc??nio anterior para o c??lculo da m??dia de todos os elementos de uma \LTree\ recorrendo a uma ??nica travessia da ??rvore (i.e.\ catamorfismo).

\end{enumerate}
Verifique as suas fun????es testando a propriedade seguinte:
\begin{propriedade}
A m??dia de uma lista n??o vazia e de uma \LTree\ com os mesmos elementos coincide,
a menos de um erro de 0.1 mil??simas:
\begin{code}
prop_avg = nonempty .==>. diff .<=. const 0.000001 where
   diff l = avg l - (avgLTree . genLTree) l
   genLTree = anaLTree lsplit
   nonempty = (>[])
\end{code}
\end{propriedade}

\Problema	(\textbf{NB}: Esta quest??o ?? \textbf{opcional} e funciona como \textbf{valoriza????o} apenas para os alunos que desejarem faz??-la.) 

\vskip 1em \noindent
Existem muitas linguagens funcionais para al??m do \Haskell, que ?? a linguagem usada neste trabalho pr??tico. Uma delas ?? o \Fsharp\ da Microsoft. Na directoria \verb!fsharp! encontram-se os m??dulos \Cp, \Nat\ e \LTree\ codificados em \Fsharp. O que se pede ?? a biblioteca \BTree\ escrita na mesma linguagem.

Modo de execu????o: o c??digo que tiverem produzido nesta pergunta deve ser colocado entre o \verb!\begin{verbatim}! e o \verb!\end{verbatim}! da correspondente parte do anexo \ref{sec:resolucao}. Para al??m disso, os grupos podem demonstrar o c??digo na oral.

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir c??lculos e diagramas em LaTeX/lhs2tex}
Como primeiro exemplo, estudar o texto fonte deste trabalho para obter o
efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo ?? \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\section{Programa????o din??mica por recursividade m??ltipla}\label{sec:recmul}
Neste anexo d??o-se os detalhes da resolu????o do Exerc??cio \ref{ex:exp} dos apontamentos da
disciplina\footnote{Cf.\ \cite{Ol18}, p??gina \pageref{ex:exp}.},
onde se pretende implementar um ciclo que implemente
o c??lculo da aproxima????o at?? |i=n| da fun????o exponencial $exp\ x = e^x$,
via s??rie de Taylor:
\begin{eqnarray}
	exp\ x 
& = &
	\sum_{i=0}^{\infty} \frac {x^i} {i!}
\end{eqnarray}
Seja $e\ x\ n = \sum_{i=0}^{n} \frac {x^i} {i!}$ a fun????o que d?? essa aproxima????o.
?? f??cil de ver que |e x 0 = 1| e que $|e x (n+1)| = |e x n| + \frac {x^{n+1}} {(n+1)!}$.
Se definirmos $|h x n| = \frac {x^{n+1}} {(n+1)!}$ teremos |e x| e |h x| em recursividade
m??tua. Se repetirmos o processo para |h x n| etc obteremos no total tr??s fun????es nessa mesma
situa????o:
\begin{spec}
e x 0 = 1
e x (n+1) = h x n + e x n

h x 0 = x
h x (n+1) = x/(s n) * h x n

s 0 = 2
s (n+1) = 1 + s n
\end{spec}
Segundo a \emph{regra de algibeira} descrita na p??gina \ref{pg:regra} deste enunciado,
ter-se-??, de imediato:
\begin{code}
e' x = prj . for loop init where
     init = (1,x,2)
     loop(e,h,s)=(h+e,x/s*h,1+s)
     prj(e,h,s) = e
\end{code}

\section{C??digo fornecido}\label{sec:codigo}

\subsection*{Problema 1}

\begin{code}
expd :: Floating a => a -> a
expd = Prelude.exp

type OutExpAr a = Either () (Either a (Either (BinOp, (ExpAr a, ExpAr a)) (UnOp, ExpAr a)))
\end{code}

\subsection*{Problema 2}
Defini????o da s??rie de Catalan usando factoriais (\ref{eq:cat}):
\begin{code}
catdef n = div (fac((2*n))) ((fac((n+1))*(fac n)))
\end{code}
Or??culo para inspec????o dos primeiros 26 n??meros de Catalan\footnote{Fonte:
\catalan{Wikipedia}.}:
\begin{code}
oracle = [
    1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796, 58786, 208012, 742900, 2674440, 9694845,
    35357670, 129644790, 477638700, 1767263190, 6564120420, 24466267020,
    91482563640, 343059613650, 1289904147324, 4861946401452
    ]
\end{code}

\subsection*{Problema 3}
Algoritmo:
\begin{spec}
deCasteljau :: [NPoint] -> OverTime NPoint
deCasteljau [] = nil
deCasteljau [p] = const p
deCasteljau l = \pt -> (calcLine (p pt) (q pt)) pt where
  p = deCasteljau (init l)
  q = deCasteljau (tail l)
\end{spec}
Fun????o auxiliar:
\begin{spec}
calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine [] = const nil
calcLine(p:x) = curry g p (calcLine x) where
   g :: (Rational, NPoint -> OverTime NPoint) -> (NPoint -> OverTime NPoint)
   g (d,f) l = case l of
       []     -> nil
       (x:xs) -> \z -> concat $ (sequenceA [singl . linear1d d x, f xs]) z
\end{spec}
2D:
\begin{code}
bezier2d :: [NPoint] -> OverTime (Float, Float)
bezier2d [] = const (0, 0)
bezier2d l = \z -> (fromRational >< fromRational) . (\[x, y] -> (x, y)) $ ((deCasteljau l) z)
\end{code}
Modelo:
\begin{code}
data World = World { points :: [NPoint]
                   , time :: Float
                   }
initW :: World
initW = World [] 0

tick :: Float -> World -> World
tick dt world = world { time=(time world) + dt }

actions :: Event -> World -> World
actions (EventKey (MouseButton LeftButton) Down _ p) world =
  world {points=(points world) ++ [(\(x, y) -> map toRational [x, y]) p]}
actions (EventKey (SpecialKey KeyDelete) Down _ _) world =
    world {points = cond (== []) id init (points world)}
actions _ world = world

scaleTime :: World -> Float
scaleTime w = (1 + cos (time w)) / 2

bezier2dAtTime :: World -> (Float, Float)
bezier2dAtTime w = (bezier2dAt w) (scaleTime w)

bezier2dAt :: World -> OverTime (Float, Float)
bezier2dAt w = bezier2d (points w)

thicCirc :: Picture
thicCirc = ThickCircle 4 10

ps :: [Float]
ps = map fromRational ps' where
  ps' :: [Rational]
  ps' = [0, 0.01..1] -- interval
\end{code}
Gloss:
\begin{code}
picture :: World -> Picture
picture world = Pictures
  [ animateBezier (scaleTime world) (points world)
  , Color white . Line . map (bezier2dAt world) $ ps
  , Color blue . Pictures $ [Translate (fromRational x) (fromRational y) thicCirc | [x, y] <- points world]
  , Color green $ Translate cx cy thicCirc
  ] where
  (cx, cy) = bezier2dAtTime world
\end{code}
Anima????o:
\begin{code}
animateBezier :: Float -> [NPoint] -> Picture
animateBezier _ [] = Blank
animateBezier _ [_] = Blank
animateBezier t l = Pictures
  [ animateBezier t (init l)
  , animateBezier t (tail l)
  , Color red . Line $ [a, b]
  , Color orange $ Translate ax ay thicCirc
  , Color orange $ Translate bx by thicCirc
  ] where
  a@(ax, ay) = bezier2d (init l) t
  b@(bx, by) = bezier2d (tail l) t
\end{code}
Propriedades e \emph{main}:
\begin{code}
runBezier :: IO ()
runBezier = play (InWindow "B??zier" (600, 600) (0,  0))
  black 50 initW picture actions tick

runBezierSym :: IO ()
runBezierSym = quickCheckWith (stdArgs {maxSize = 20, maxSuccess = 200} ) prop_bezier_sym
\end{code}

Compila????o e execu????o dentro do interpretador:\footnote{Pode ser ??til em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma fun????o
|main|.}
\begin{code}
main = runBezier

run = do { system "ghc cp2021t" ; system "./cp2021t" }
\end{code}

\subsection*{QuickCheck}
C??digo para gera????o de testes:
\begin{code}
instance Arbitrary UnOp where
  arbitrary = elements [Negate, E]

instance Arbitrary BinOp where
  arbitrary = elements [Sum, Product]

instance (Arbitrary a) => Arbitrary (ExpAr a) where
  arbitrary = do
    binop <- arbitrary
    unop  <- arbitrary
    exp1  <- arbitrary
    exp2  <- arbitrary
    a     <- arbitrary

    frequency . map (id >< pure) $ [(20, X), (15, N a), (35, Bin binop exp1 exp2), (30, Un unop exp1)]


infixr 5 .=?=.
(.=?=.) :: Real a => a -> a -> Bool
(.=?=.) x y = (toRational x) == (toRational y)


\end{code}

\subsection*{Outras fun????es auxiliares}
%----------------- Outras defini????es auxiliares -------------------------------------------%
L??gicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}

%----------------- Solu????es dos alunos -----------------------------------------%

\section{Solu????es dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas solu????es para os exerc??cios
propostos, de acordo com o "layout" que se fornece. N??o podem ser
alterados os nomes ou tipos das fun????es dadas, mas pode ser adicionado
texto, disgramas e/ou outras fun????es auxiliares que sejam necess??rias.

Valoriza-se a escrita de \emph{pouco} c??digo que corresponda a solu????es
simples e elegantes. 

\subsection*{Problema 1} \label{pg:P1}
S??o dadas:
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

A fun????o de out deste tipo deve receber uma ExpAr e fornecer os dados relevantes
identificando-os apropriadamente de acordo com a inExpAr j?? utilizada. 

Assim sendo, para express??es de vari??veis (X), como n??o temos nenhum par??metro, devolvemos 
apenas '()' identificado com Left. Todos os outros tipos de express??es ser??o ent??o identificadas
Right e mais um  (ou dois para as express??es) identificador para os diferenciar entre eles.
\begin{code}
outExpAr X = i1 ()
outExpAr (N a) = i2 (i1 a)
outExpAr (Bin op ex1 ex2) = i2 (i2 (i1 (op, (ex1, ex2))))
outExpAr (Un op ex) = i2 (i2 (i2 (op, ex)))
\end{code}
---
A fun????o recExpAr est?? respons??vel pela recursividade de um catamorfismo. Como tal,
faz sentido que ela aplique a fun????o fornecida como argumento apenas ??s parte recursivas
das express??es, ou seja, ?? express??es que estejam dentro do tipo de dados criado pelo out.
Os casos em que temos express??es dentro do nosso tipo de dados s??o os casos das opera????es,
nos quais a outExpAr devolve  o (devidamente identificado) par de opera????o express??o/express??es.
Sendo assim, esta fun????o tem de aplicar ao tipo de dados a fun????o fornecida ??s express??es das poss??veis
opera????es, deixando outros identificadores iguais (id). Usando a fun????o baseExpAr, basta indicarmos
onde aplicar id e onde aplicar a fun????o fornecida.
\begin{code}
recExpAr f = baseExpAr id id id f f id f
\end{code}
---
Num catamorfismo de ExpAr, o gene vai sempre receber o tipo 1 + (B + (C + D)), em que
o 1 corresponde a uma express??o de vari??vel, B a uma constante (N 0, por exemplo), C a uma
opera????o bin??ria e D a uma opera????o un??ria. Sendo assim, o nosso gene de eval
tem de devolver o float fornecido para vari??veis, o pr??prio valor para constantes, e 
finalmente operar segundo as opera????es que encontrar (que definimos nas fun????es auxiliares)
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
Para este hilomorfismo, o nosso anamorfismo vai tratar de limpar poss??veis casos
de absor????o nas opera????es das express??es fornecidas, sendo assim respons??vel pela
parte do algoritmo de otimiza????o. O catamorfismo utilizado ?? o que definimos na al??nea
anterior, sendo respons??vel por calcular o valor de uma express??o. 

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

A fun????o sd j?? implementada executa um catamorfismo que devolve um par e usa a fun????o
p2 para usar apenas o segundo elemento do par. O par cont??m no elemento da esquerda
a express??o original e no elemento da direita a express??o derivada. Como tal, o nosso
gene ter?? de devolver esse par. Sendo assim, o nosso gene ser?? um split. ?? esquerda do split
ser?? trabalhado o tipo de dados para remover a informa????o relativa ?? derivada (Ou seja,
ser??o trabalhadas as express??es para que tenham apenas a informa????o relativa ?? express??o
original). Ap??s esta tarefa, o tipo de dados passa pelo inExpAr e ?? transformado de volta numa
express??o. O lado direito do split fica ent??o respons??vel por aplicar as leis da deriva????o
aos casos diferentes de express??es, utilizando onde necess??ria a informa????o relativa ??s express??es
originais ou ??s derivadas de express??es em opera????es calculadas recursivamente.
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


A fun????o ad, tal como a sd, usa um catamorfismo que devolve um par e apenas
usa o segundo elemento do par. Este par cont??m na esquerda o valor da express??o
original e na direita o valor da express??o derivada. Como tal, o nosso gene vai ser um split
em que ?? esquerda trabalhamos com os valores calculados recursivamente para a express??o original,
e ?? direita aplicamos as leis da deriva????o relevantes para calcular a derivada usando valores
calculados recursivamente nas express??es de opera????es. As fun????es auxiliares x_ad trabalham
todas sobre um tipo de express??o, aplicando as leis da deriva????o relevantes para cada tipo.

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


\subsection*{Problema 2}

Incrementa os denominaodes. O caso de paragem do d ?? 1 e o caso de paragem desta fun????o d?? 2 porque estamos a trabalhar
no padr??o n+1, ou seja, quando fazemos 1 (caso paragem do d) + 1 d?? 2 que corresponde ao caso de paragem do di.
Aqui estamos a somar 1 porque estamos no padr??o n+1 porque ?? como se tivessemos a somar come??ando no 1 (sem ser no caso de paragem),
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

Incrementa os numeradores sucessivos. O caso de paragem do nume ?? 1 e o caso de paragem desta fun????o d?? 3 porque estamos a trabalhar
no padr??o n+1, ou seja, quando fazemos 1 (caso paragem do nume) + (1+1) d?? 3 que corresponde ao caso de paragem do numei.
Aqui estamos a somar 2 porque estamos no padr??o n+1 porque ?? como se tivessemos a somar come??ando no 1 (sem ser no caso de paragem),
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

Fra????o que corresponde ao quociente entre o numerador e o denominador

\begin{code}
quotient 0 = 1
quotient n = numerator n / denominator n
\end{code}  

Na primeira componente temos o quociente entre o numero e o denominador. 
Na segunda compoente temos o produto do numerador pelo seu numerador sucessivo + 1 pelo numerador sucessivo para obter o numerador pretendido.
Na terceira compoente temos o produto do denominador pelo seu denominadorsucessivo + 1 pelo denominador sucessivo para obter o 
numerador pretendido.
A quarta componente corresponde ?? fun????o numei para incrementar os numeradores sucessivos.
A quinta componente corresponde ?? fun????o a para incrementar os denominadores sucessivos.

\begin{code}
loop (quotient , numerator , denominator , numerator_incrementer , denominator_incrementer) = (div numerador denominator , numerator * (numerator_incrementer + 1) * numerator_incrementer , denominator * (denominator_incrementer + 1) * denominator_incrementer , numerator_incrementer + 2 , denominator_incrementer + 1)  
\end{code} 

Valores dos casos de paragem de cada uma das fun????es

\begin{code}
inic = (1 , 1 , 1 , 3 , 2)
\end{code} 

Fun????o principal ?? a f

\begin{code}
prj (f , g , h , i , j) = f 
\end{code}  

por forma a que
\begin{code}
cat = prj . (for loop inic)
\end{code}
seja a fun????o pretendida.
\textbf{NB}: usar divis??o inteira.

\subsection*{Problema 3}
A resolu??o da primeira al??nea passar por adaptarmos o algoritmo fornecido a um catamorfismo.
Usando a fun????o auxiliar g usada na fun????o fornecida, basta criarmos um catamorfismo de listas
que aplica essa fun????o auxiliar a listas n??o vazias e devolve a lista vazia para listas tamb??m vazias
(Ou seja, pontos de dimens??o 0).

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
Para a segunda al??nea, decidimos utilizar um hilomorfismo de LTree. O anamorfismo
ser?? respons??vel por, para listas de NPoints n??o vazias (sendo o caso da lista)
vazia tratada por pattern matchin na fun????o deCasteljau), gerar uma LTree em que
o ramo da esquerda corresponde ao init da lista e o ramo da direita corresponde ??
tail da lista.  

Este ?? o passo de "divide" do nosso hilomorfismo, em que dividimos a
lista de pontos at?? s?? termos um ponto em cada nodo. 

O nosso catamorfismo ?? assim a fase de conquer, em que resolvemos os problemas
que foram reduzidos no divide. Usamos a fun????o auxiliar utilizada na fun????o deCasteljau
fornecida para transformar os pontos nos pares de leafs das ltree, transformando gradualmente
a LTree num OverTime NPoint atrav??s do c??lculo de baixo para cima das curvas.

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


\subsection*{Problema 4}

Solu????o para listas n??o vazias:

Para a resolu????o da primeira al??nea, resolvemos o problema utilizando a lei da recursividade m??tua (\textit{Fokkinga}). Assim sendo, desenvolvemos da seguinte forma:

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
Desenvolvendo o sistema, separando o h e o k em h1 e h2, k1 e k2, e introduzindo vari??veis, ficamos com as seguintes equa????es:
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
Finalmente removemos as vari??veis novamente e definimos a nossa implementa????o efetiva em haskell.
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
\just\equiv{ Defini????es de h e k }
%
|<avg, len> = cata [<const 0, const 0>, <mydiv.<myadd.<p1, (mymul.p2)>, k2>, succ.p2.p2>]|
\end{eqnarray*}
E finalmente chegamos ?? solu????o da al??nea. S??o definidas e utilizadas as fun????es mydiv, etc devido a problemas com o interpretador no uso das fun????es j?? definidas nos m??dulos fornecidos.
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
Solu????o para ??rvores de tipo \LTree:

Para este caso olhamos para o diagrama do catamorfismo em quest??o. Esta al??nea passa por adaptar o nosso gene ao catamorfismo da LTree.


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

Definimos ent??o h1 e k1 como a m??dia e comprimento de uma Leaf e h2 e k2 como m??dia e comprimento de um Fork, que s??o defini????es facilmente implementadas em haskell.
\begin{code}
avgLTree = p1.cataLTree gene where
    k2 = myadd . (split (p2.p1) (p2.p2))
    h2 = mydiv . (split (myadd . (split (mymul.p1) (mymul.p2))) k2)
    gene = either (split id (const 1)) (split h2 k2)
\end{code}


\subsection*{Problema 5}
Inserir em baixo o c??digo \Fsharp\ desenvolvido, entre \verb!\begin{verbatim}! e \verb!\end{verbatim}!:


\begin{verbatim}
module cp2021t

open Cp


// (1) Datatype definition -----------------------------------------------------
//data BTree a = Empty | Node(a, (BTree a, BTree a)) deriving Show
type BTree<'a> = Empty | Node of 'a * (BTree<'a> * BTree<'a>)

let inBTree a = either (konst Empty) Node x 

let outBTree a = 
    match a with 
        | Empty -> Left ()
        | (Node(a , (t1 , t2))) -> Right (a , (t1 , t2))

// (2) Ana + cata + hylo -------------------------------------------------------
let recBTree g = baseBTree id g

let cataBTree g a = (g << (recBTree (cataBTree g)) << outBTree) a

let anaBTree g a = (inBTree << (recBTree (anaBTree g) ) << g) a

let hyloBTree h g = cataBTree h << anaBTree g

let baseBTree f g = id -|- (f >< (g >< g))

// (3) Map ---------------------------------------------------------------------
(*
    instance Functor BTree
            where fmap f = cataBTree ( inBTree . baseBTree f id )
*) 

// (4) Examples ----------------------------------------------------------------
// (4.1) Inversion (mirror) ----------------------------------------------------
let invBTree a = cataBTree (inBTree << (id -|- (id >< swap))) a

// (4.2) Counting --------------------------------------------------------------

let countBTree a = cataBTree (either (konst 0) (succ << (uncurry (+)) << p2)) a 

// (4.3) Serialization ---------------------------------------------------------
let inordt = cataBTree inord    

let inord a = either nil join

let join (x,(l,r)) = l @ [x] @ r

let preordt = cataBTree preord

let preord = (either nil preord_g)

let preord_g (x,(l,r)) = x :: l @ r

let postordt = cataBTree (either nil postordt_g)

let postordt_g (x,(l,r)) = l @ r @ [x]

// (4.4) Quicksort -------------------------------------------------------------
let qSort a = hyloBTree inord qsep

//let qsep [] = Left ()
//let qsep list = Right (list.Head part (fun a -> a < list.Head) list.Tail) 

let qsep list = 
    match list with
        | list.isEmpty -> Left ()
        | _            -> Right (list.Head part ( fun a -> a < list.Head)  list.Tail)

let part p [] = ([],[])
let rec part p list =
    match list.Length with
        | p list.Head -> let (s,l) = part p list.Tail in (list.Head @ s, l) 
        | otherwise   -> let (s,l) = part p list.Tail in (s, list.Head @ l)

// (4.5) Traces ----------------------------------------------------------------

let traces = cataBTree (Either (konst [[]]) tunion)

let tunion (a, (l,r)) = union (map (fun x -> a @ x) l) (map (fun x -> a @ x) r)

// (4.6) Towers of Hanoi -------------------------------------------------------

let hanoi = hyloBTree present strategy

// where

let present = inord

let strategy d n = 
    match n with
        | 0     -> Left ()
        | _     -> Right ((n,d), ((not d,n), (not d,n)))

// (5) Depth and balancing (using mutual recursion) --------------------------

let balBTree = p1 . baldepth

let depthBTree = p2 . baldepth

let baldepth = cataBTree depbal

let depbal = Either (konst (True, 1)) ( (fun (a,((b1,b2),(d1,d2))) -> (b1 && b2 && abs(d1-d2)<=1,1+max d1 d2)) . ( id  ><  (fun ((b1,d1),(b2,d2)) -> ((b1,b2),(d1,d2))))

// (6) Going polytipic -------------------------------------------------------

// (7) Zipper ----------------------------------------------------------------
type Deriv<'a> = Dr Bool 'a * (Btree<'a>)

type Zipper a = [ Deriv a ]

let rec plug list t =
    match list with
        | list.isEmpty  -> t
        | _             -> match list.Head with 
                            | Dr (False a l) -> Node (a, (plug list.Tail t, l))
                            | Dr (True a r)  -> Node (a, (r, plug list.Tail t))
\end{verbatim}

%----------------- Fim do anexo com solu????es dos alunos ------------------------%

%----------------- ??ndice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp2021t}

%----------------- Fim do documento -------------------------------------------%
\end{document}
