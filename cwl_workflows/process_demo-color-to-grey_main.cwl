cwlVersion: v1.2
$graph:
- class: Workflow
  label: demo-color-to-grey
  doc: Convert an input image to greyscale using GDAL.
  id: demo-color-to-grey
  inputs:
    input_image:
      doc: Path to the input image to convert to greyscale (any GDAL-readable raster
        format)
      label: Input image
      type: File
    output_file:
      doc: Name of the output greyscale GeoTIFF file (written inside output/)
      label: Output filename
      type: string?
      default: greyscale.tif
  outputs:
    out:
      type: Directory
      outputSource: process/outputs_result
  steps:
    process:
      run: '#main'
      in:
        input_image: input_image
        output_file: output_file
      out:
      - outputs_result
- class: CommandLineTool
  id: main
  requirements:
    DockerRequirement:
      dockerPull: ghcr.io/marjo-luc/demo-color-to-grey:main
    NetworkAccess:
      networkAccess: true
    ResourceRequirement:
      ramMin: 2048
      coresMin: 1
      outdirMax: 512
  baseCommand: run.py
  inputs:
    input_image:
      type: File
      inputBinding:
        position: 1
        prefix: --input_image
    output_file:
      type: string?
      inputBinding:
        position: 2
        prefix: --output_file
      default: greyscale.tif
  outputs:
    outputs_result:
      outputBinding:
        glob: ./output*
      type: Directory
s:author:
- class: s:Person
  s:name: Marjorie Lucas
s:contributor:
- class: s:Person
  s:name: Marjorie Lucas
s:citation: https://github.com/marjo-luc/my-sample-algorithm.git
s:codeRepository: https://github.com/marjo-luc/my-sample-algorithm.git
s:commitHash: 7fbb68fa946368f67c40a2d9999de9e60166dfe1
s:dateCreated: 2026-10-08
s:license: None
s:softwareVersion: 1.0.0
s:version: main
s:releaseNotes: None
s:keywords: ogc, gdal, image-processing, greyscale
$namespaces:
  s: https://schema.org/
$schemas:
- https://raw.githubusercontent.com/schemaorg/schemaorg/refs/heads/main/data/releases/9.0/schemaorg-current-http.rdf
