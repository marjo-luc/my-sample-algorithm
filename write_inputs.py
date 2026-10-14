#!/usr/bin/env python3
"""Accept four string inputs and write them to an output text file."""

import argparse
import os

OUTPUT_DIR = "output"


def parse_args():
    parser = argparse.ArgumentParser(description="Write string inputs to a text file.")
    parser.add_argument("--required_no_default")
    parser.add_argument("--required_default")
    parser.add_argument("--optional_no_default")
    parser.add_argument("--optional_default")
    parser.add_argument(
        "--output_file",
        default="output.txt",
        help="Name of the output text file, written inside output/ (default: output.txt)",
    )
    return parser.parse_args()


def main():
    args = parse_args()

    os.makedirs(OUTPUT_DIR, exist_ok=True)
    output_path = os.path.join(OUTPUT_DIR, args.output_file)

    with open(output_path, "w") as f:
        f.write(f"required_no_default: {args.required_no_default}\n")
        f.write(f"required_default: {args.required_default}\n")
        f.write(f"optional_no_default: {args.optional_no_default}\n")
        f.write(f"optional_default: {args.optional_default}\n")

    print(f"Wrote inputs to {output_path}")


if __name__ == "__main__":
    main()
