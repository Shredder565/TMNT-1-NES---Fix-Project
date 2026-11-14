PYTHON ?= python3
.PHONY: build verify test tiles recovery exploratory xrefs studio clean

build:
	$(PYTHON) tools/build.py

verify:
	$(PYTHON) tools/build.py --expect-vanilla

test:
	$(PYTHON) -m unittest discover -s tests -v

tiles:
	$(PYTHON) tools/chr_editor.py export

studio:
	$(PYTHON) tools/sprite_studio.py

recovery: verify
	$(PYTHON) tools/recover_code.py "build/Teenage Mutant Ninja Turtles (Rebuilt).nes"

exploratory:
	$(PYTHON) tools/build.py --source-dir analysis/exploratory_source --expect-vanilla --output build/TMNT_Exploratory_Rebuilt.nes

xrefs:
	$(PYTHON) tools/xref_report.py

clean:
	rm -f "build/Teenage Mutant Ninja Turtles (Rebuilt).nes" "build/TMNT_Exploratory_Rebuilt.nes"

.PHONY: dispatch speed performance-test

dispatch: verify
	$(PYTHON) tools/recover_dispatch.py "build/Teenage Mutant Ninja Turtles (Rebuilt).nes" --out analysis/dispatch_source

speed:
	$(PYTHON) tools/build_speed_mod.py

performance-test: test
	$(PYTHON) tools/build.py --source-dir mods/lag_reduction_v1/source --output build/TMNT_NES_Lag_Reduction_v1_EXPERIMENTAL.nes
