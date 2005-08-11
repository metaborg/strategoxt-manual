[
   Var                  -- _1,
   Int                  -- _1,
   Plus                 -- H[_1 "+" _2],
   Minus                -- H[_1 "-" _2],
   Assign               -- H[_1 ":=" _2],
   Seq                  -- H hs=0["(" V[_1] ")"],
   Seq.1:iter-star-sep  -- H hs=0[_1 ";"],
   If                   -- V[V is=2[H["if" _1 "then"] _2] 
                             V is=2["else" _3]],
   Call                 -- H hs=0[_1 "(" H[_2] ")"],
   Call.2:iter-star-sep -- H hs=0[_1 ","]
]
