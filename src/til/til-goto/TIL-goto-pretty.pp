[
   Declaration         -- H hs=0[H[KW["var"] _1] KW[";"]],
   Assign              -- H hs=0[H[_1 KW[":="] _2] KW[";"]],
   Read                -- H hs=0[H[KW["read"] _1] KW[";"]],
   Write               -- H hs=0[H[KW["write"] _1] KW[";"]],
   Block               -- V[V is=2[KW["begin"] V[_1]] KW["end"]],
   Block.1:iter-star   -- _1,
   IfThen              -- V[V is=2[H[KW["if"] _1 KW["then"]] V[_2]] KW["end"]],   
   IfThen.2:iter-star  -- _1,
   IfElse              -- V[V is=2[H[KW["if"] _1 KW["then"]] V[_2]] V is=2[KW["else"] V[_3]] KW["end"]],
   IfElse.2:iter-star  -- _1,
   IfElse.3:iter-star  -- _1,
   While               -- V[V is=2[H[KW["while"] _1 KW["do"]] _2] KW["end"]],
   While.2:iter-star   -- _1,
   For                 -- V[V is=2[H[KW["for"] _1 KW[":="] _2 KW["to"] _3 KW["do"]] _4] KW["end"]],
   For.4:iter-star     -- _1,
   Var                 -- _1,
   Int                 -- _1,
   String              -- _1,
   Mul                 -- H hs=1[_1 KW["*"] _2],
   Div                 -- H hs=1[_1 KW["/"] _2],
   Mod                 -- H hs=1[_1 KW["%"] _2],
   Add                 -- H hs=1[_1 KW["+"] _2],
   Sub                 -- H hs=1[_1 KW["-"] _2],
   Lt                  -- H hs=1[_1 KW["<"] _2],
   Gt                  -- H hs=1[_1 KW[">"] _2],
   Equ                 -- H hs=1[_1 KW["="] _2],
   Neq                 -- H hs=1[_1 KW["!="] _2],
   And                 -- H hs=1[_1 KW["&"] _2],
   Or                  -- H hs=1[_1 KW["|"] _2],
   Program             -- V[_1],
   Program.1:iter-star -- _1,
   Parenthetical       -- H hs=0["(" _1 ")"]
   Label               -- H hs=0[H[KW["label"] _1] KW[";"]],
   Jump                -- H hs=0[H[KW["goto"] _1] KW[";"]],
   CJump               -- H hs=0[H[KW["if"] _1 KW["goto"] _2] KW[";"]]
]
