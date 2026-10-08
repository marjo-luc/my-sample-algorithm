#!/usr/bin/env python3
"""Entrypoint that maps the OGC ``--<name> value`` inputs onto papermill
parameters and executes the demo_color_to_greyscale notebook.

Each argparse flag here must match an input `name` in algorithm_config.yml, and
each parameter key must match a variable in the notebook's `parameters` cell.
"""

import argparse
import os

import papermill as pm

NOTEBOOK_PATH = "/app/demo_color_to_greyscale.ipynb"
OUTPUT_DIR = "output"


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Execute the demo_color_to_greyscale notebook with papermill."
    )
    parser.add_argument(
        "--input_image",
        required=True,
        help="Path to the input image to convert to greyscale.",
    )
    parser.add_argument(
        "--output_file",
        default="greyscale.tif",
        help="Name of the output greyscale file (default: greyscale.tif).",
    )
    args = parser.parse_args()

    # The notebook writes results into ./output; keep the executed copy there too.
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    executed_notebook = os.path.join(OUTPUT_DIR, "executed_demo_color_to_greyscale.ipynb")

    pm.execute_notebook(
        NOTEBOOK_PATH,
        executed_notebook,
        parameters={
            "input_image": args.input_image,
            "output_file": args.output_file,
        },
    )


if __name__ == "__main__":
    main()
