from pathlib import Path

import invoke
from functional import seq


@invoke.task
def generate_visualisations(context: invoke.Context):
    parent_directory = Path(__file__).parent
    visualisation_directory = parent_directory / "visualisations"
    visualisation_directory.mkdir(exist_ok=True)
    configuration_path = parent_directory / "keymap_drawer.yaml"
    for layout_directory in (
            seq((parent_directory / "layouts").iterdir())
                    .filter(lambda path: path.is_dir())
    ):
        keymap_path = layout_directory / "glove80.keymap"
        keymap_yaml_path = Path("glove80_keymap.yaml")
        keymap_svg_path = visualisation_directory / f"{layout_directory.name}_keymap.svg"
        context.run(f"keymap -c {configuration_path.as_posix()} parse -c 10 -z "
                    f"{keymap_path.as_posix()} > {keymap_yaml_path.as_posix()}")
        context.run(f"keymap -c {configuration_path.as_posix()} draw "
                    f"{keymap_yaml_path.as_posix()} > {keymap_svg_path.as_posix()}")
        keymap_yaml_path.unlink()
