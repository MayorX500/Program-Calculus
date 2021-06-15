module BTree

open Cp

//data BTree a = Empty | Node(a, (BTree a, BTree a)) deriving Show
type BTree<'a> = Empty | Node of 'a * (BTree<'a> * BTree<'a>)


let inBTree a = either (konst Empty) Node x 

let outBTree a = 
    match a with 
        | Empty -> Left()
        | (Node(a , (t1 , t2))) = Right(a , (t1 , t2))

let recBTree g = baseBTree id g

let cataBTree g a = (g << (recBTree (cataBTree g)) << outBTree) a

let anaBTree g a = (inBTree << (recBTree (anaBTree g) ) << g) a

let hyloBTree h g = cataBTree h << anaBTree g

let baseBTree f g = id -|- (f >< (g >< g))

(*
    instance Functor BTree
            where fmap f = cataBTree ( inBTree . baseBTree f id )
*) 

let invBTree a = cataBTree (inBTree << (id -|- (id >< swap))) a

let countBTree a = cataBTree (either (const 0) (succ << (uncurry (+)) << p2)) a 

let inordt = cataBTree inord    

let inord a = either nil join
                when
                    join(x,(l,r)) = l @ [x] @ r

let preordt = cataBTree preord

let preord = (either nil f)
                when
                    f(x,(l,r)) = x :: l @ r

let postordt = cataBTree (either nil f)
                when
                    f(x,(l,r)) = l @ r @ [x]

let qSort a = hyloBTree inord qsep
        