TARGETS = Statements.def Statements.tbl Statements.str Statements.pp\
	test1.acub \
	test1-ntt.png \
	test1-acub.png \
	test1-acub-abox.png \
	Plus.png \
	PlusTimes.png \
	test2-ntt.png \
	test4-ntt.png \
	test4-acub.png \
	test5-ntt.png \
	test5-acub.png \
	test6-ntt.png \
	test6-unparse.png \
	test6-acub.png \
	test6-abox-tree.png \
	\
	test7-acub.png \
	test7-abox-tree.png \
	\
	transf-cycle.png \
	sharing-scub.png \
	sharing-acub.png \

DOTFLAGS = -Nshape=plaintext \
	-Nfontname=courier \
	-Nfontsize=8 \
	-Efontname=courier \
	-Efontsize=8 \
        -Nwidth="0.1" \
        -Nheight="0.1" \
        -Earrowhead=none \
        -Granksep=0.15 \
        -Gnodesep=0.1 

test1-ntt_DOTFLAGS = $(DOTFLAGS)
test1-acub_DOTFLAGS = $(DOTFLAGS)
test1-acub-abox_DOTFLAGS = $(DOTFLAGS)
Plus_DOTFLAGS = $(DOTFLAGS)
PlusTimes_DOTFLAGS = $(DOTFLAGS)
test4-ntt_DOTFLAGS = $(DOTFLAGS)
test5-ntt_DOTFLAGS = $(DOTFLAGS)
test6-ntt_DOTFLAGS = $(DOTFLAGS)
test4-acub_DOTFLAGS = $(DOTFLAGS)
test5-acub_DOTFLAGS = $(DOTFLAGS)
test6-acub_DOTFLAGS = $(DOTFLAGS)
test6-unparse_DOTFLAGS = $(DOTFLAGS)
test6-abox-tree_DOTFLAGS = $(DOTFLAGS)
sharing-scub_DOTFLAGS = $(DOTFLAGS)
sharing-acub_DOTFLAGS = $(DOTFLAGS)
test7-acub_DOTFLAGS = $(DOTFLAGS)
test7-abox-tree_DOTFLAGS = $(DOTFLAGS)

transf-cycle_DOTFLAGS = \
	-Nshape=box \
	-Nfontname=courier \
	-Nfontsize=8 \
	-Efontname=courier \
	-Efontsize=8 
        -Nwidth="0.1" \
        -Nheight="0.05" \
        -Nfixed-size=true \
        -Granksep=0.2 \
        -Gnodesep=0.2 

all: $(TARGETS)

clean:
	rm -f $(TARGETS) $(wildcard *.acub) $(wildcard *.ecub)

.PRECIOUS: %.acub 

######################################################################
##
## PROCESSING

%.def: %.sdf $(wildcard *.sdf)
	pack-sdf -i $< -o $@

%.tbl: %.def
	sdf2table -i $< -o $@ -m $*

%.cubfix : %.cub Statements.tbl
	sglr -p Statements.tbl -i $< -o $@ -t -2 -v

%.acub: %.cub Statements.tbl
	sglri -p Statements.tbl -i $< -o $@ --verbose 0
#	implode-asfix -i $< -o $@

%.ecub: %.cub Cub-Expressions.tbl 
	sglri -p Cub-Expressions.tbl -i $< \
	| implode-lit -o $@

%.str: %.def
	sdf2rtg -i $< -m $* | rtg2sig -o $@ 

%.pp: %.def
	ppgen -i $< -o $@

%.acub.abox: %.acub Statements-pretty.pp
	ast2abox -i $< -o $@ -p Statements-pretty.pp

%.txt: %.abox 
	abox2text -i $< -o $@ 

% : %.str
	strc -i $< -o $@ --main $*

######################################################################
##
## PRESENTATION

%.ntt: %.cubfix Makefile implode-lit
	implode-asfix --pt --layout -i $< \
	| implode-asfix --nt \
	| implode-asfix --lex \
	| ./implode-lit \
	-o $@

%.entt: %.cub Makefile implode-lit
	sglr -2 -p Cub-Expressions.tbl -i $< \
	| implode-asfix --pt --layout \
	| implode-asfix --nt \
	| implode-asfix --lex \
	| implode-lit \
	-o $@

%.apt: %.cubfix Makefile
	implode-asfix --pt --layout -i $< \
	| implode-asfix --lex \
	-o $@

#	| implode-asfix --nt  \
#	| implode-asfix --lex 

%-ntt.dot: %.ntt
	term-to-dot --tree -i $< -o $@ --verbose 0

%-entt.dot: %.ntt
	term-to-dot --tree -i $< -o $@ --verbose 0

%-acub.dot: %.acub
	term-to-dot --tree -i $< -o $@ --verbose 0

%-ecub.dot: %.ecub
	term-to-dot --tree -i $< -o $@ --verbose 0

%-scub.dot: %.acub
	term-to-dot --graph -i $< -o $@ --verbose 0

%-acub-abox.dot: %.acub.abox
	term-to-dot --tree -i $< -o $@ --verbose 0

%.png: %.dot Makefile
	dot $($*_DOTFLAGS:$(DOTFLAGS)) -Tpng $< > $@

%-tree.dot : %.trm
	term-to-dot --tree -i $< -o $@ --verbose 0
