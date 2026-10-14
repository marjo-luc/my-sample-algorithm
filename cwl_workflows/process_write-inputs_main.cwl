cwlVersion: v1.2
$graph:
- class: Workflow
  label: write-inputs
  doc: Write four text inputs to a text file.
  id: write-inputs
  inputs:
    required_no_default:
      doc: Input is required and has no default specified
      label: required_no_default
      type: string
    required_default:
      doc: Input is required and default is specified
      label: required_default
      type: string
      default: required_default default value
    optional_no_default:
      doc: Input is optional and has no default specified
      label: optional_no_default
      type: string?
    optional_default:
      doc: Input is optional and default is specified
      label: optional_default
      type: string?
      default: optional_default default value
    output_file:
      doc: Name of the output text file (written inside output/)
      label: Output filename
      type: string?
      default: output.txt
  outputs:
    out:
      type: Directory
      outputSource: process/outputs_result
  steps:
    process:
      run: '#main'
      in:
        required_no_default: required_no_default
        required_default: required_default
        optional_no_default: optional_no_default
        optional_default: optional_default
        output_file: output_file
      out:
      - outputs_result
- class: CommandLineTool
  id: main
  requirements:
    DockerRequirement:
      dockerPull: ghcr.io/marjo-luc/write-inputs:main
    NetworkAccess:
      networkAccess: true
    ResourceRequirement:
      ramMin: 256
      coresMin: 1
      outdirMax: 10
  baseCommand: write_inputs.py
  inputs:
    required_no_default:
      type: string
      inputBinding:
        position: 1
        prefix: --required_no_default
    required_default:
      type: string
      inputBinding:
        position: 2
        prefix: --required_default
      default: required_default default value
    optional_no_default:
      type: string?
      inputBinding:
        position: 3
        prefix: --optional_no_default
    optional_default:
      type: string?
      inputBinding:
        position: 4
        prefix: --optional_default
      default: optional_default default value
    output_file:
      type: string?
      inputBinding:
        position: 5
        prefix: --output_file
      default: output.txt
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
s:commitHash: 96fb8e20ffefa82cd60ea187cb4aa851e2729d41
s:dateCreated: 2026-10-14
s:license: None
s:softwareVersion: 1.0.0
s:version: main
s:releaseNotes: None
s:keywords: ogc, demo, text
$namespaces:
  s: https://schema.org/
$schemas:
- https://raw.githubusercontent.com/schemaorg/schemaorg/refs/heads/main/data/releases/9.0/schemaorg-current-http.rdf
