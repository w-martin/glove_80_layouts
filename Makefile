vis:
	poetry run inv generate-visualisations

pre_build:
	docker build --file docker/build_firmware.Dockerfile --tag zmk-build .
	mkdir -p build

hands_down_vv:
	docker run --replace --name glove_80_firmware_build_container zmk-build nix-build built_hands_down_vv -o built_hands_down_vv
	docker cp glove_80_firmware_build_container:/usr/src/app/built_hands_down_vv/glove80.uf2 build/hands_down_vv.uf2

hands_down_vb:
	docker run --replace --name glove_80_firmware_build_container zmk-build nix-build built_hands_down_vb -o built_hands_down_vb
	docker cp glove_80_firmware_build_container:/usr/src/app/built_hands_down_vb/glove80.uf2 build/hands_down_vb.uf2

_rhodium_firmware:
	docker run --replace --name glove_80_firmware_build_container zmk-build nix-build hands_down_rhodium -o built_hands_down_rhodium
	docker cp glove_80_firmware_build_container:/usr/src/app/built_hands_down_rhodium/glove80.uf2 build/hands_down_rhodium.uf2

rhodium:
	make vis
	make pre_build
	make _rhodium_firmware

all:
	make vis
	make pre_build
	make hands_down_vv
	make hands_down_vb
	make _rhodium_firmware
