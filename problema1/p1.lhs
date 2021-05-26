\subsection*{Problema 1}
Definir outExpAr
\begin{code}

-- definir outExpAr

outExpAr (N a) = i2 . i1 $ a
outExpAr (Bin op a b) = i2 . i2 . i1 $ (op, (a, b))
outExpAr (Un op a) = i2 . i2 . i2 $ (op, a)

-- Estou empancado por causa de

---outExpAr :: ExpAr a -> Either () (Either a (Either (BinOp, (ExpAr a, ExpAr a)) (UnOp, ExpAr a)))
---Non-exhaustive patterns in function outExpAR
-- X
---Non-exhaustive patterns in function outExpAr
-- Left ()

\end{code}
Definir recExpAr
\begin{code}
recExpAr = undefined

\end{code}

Definir g_eval_exp a
\begin{code}
g_eval_exp a = undefined

-- estava a pensar algo nesta linha de pensamento
-- g_eval_exp (BinOp N, a) = a
-- g_eval_exp (BinOp Sum, (a, b)) = (+) a b
-- g_eval_exp (BinOp Product, (a, b)) = (*) a b
-- g_eval_exp (UnOp E, a) = (*) a -- what's the symbol for exponencial in haskell?
-- g_eval_exp (UnOp Negate, a) = (*) a -- what's the symbol to get the reverse? maybe just 0 - a

\end{code}

Definir clean
\begin{code}

\end{code}

Definir gopt
\begin{code}

\end{code}

Definir sd_gen
\begin{code}

\end{code}

Definir ad_gen
\begin{code}

\end{code}
