# algorithm
run_onemax:
	mix run -e "Geneticx.run(OneMax)"

run_speller:
	mix run -e "Geneticx.run(Speller)"

run_cargo:
	mix run -e "Geneticx.run(Cargo)"


# docs
doc_build:
	mix docs
