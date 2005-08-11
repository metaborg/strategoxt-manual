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
   Call.2:iter-star-sep -- H hs=0[_1 ","],

   Uminus -- KW["-"] _1,
   Times -- H[_1 KW["*"] _2],
   Eq -- _1 KW["="] _2,
   Gt -- _1 KW[">"] _2,
   Assign -- _1 KW[":="] _2,
   While -- KW["while"] _1 KW["do"] _2,
   Let -- KW["let"] _1 KW["in"] _2 KW["end"],
   Let.1:iter-star -- _1,
   Let.2:iter-star-sep -- _1 KW[";"],
   VarDec -- KW["var"] _1 KW[":="] _2,
   FunDecs -- _1,
   FunDecs.1:iter -- _1,
   FunDec -- KW["function"] _1 KW["("] _2 KW[")"] KW["="] _3,
   FunDec.2:iter-star-sep -- _1 KW[","]
]
