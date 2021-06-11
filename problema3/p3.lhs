\subsection*{Problema 3}

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