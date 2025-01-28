#!/usr/bin/env cwl-runner
arguments:
- -p
- input
- $(inputs.input.path)
- -p
- output
- $(runtime.outdir)
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- --cwd
- /home/jovyan
- "process_out.ipynb"
- -f
- /tmp/inputs.json
- -k
- python3
- --log-output
class: CommandLineTool
cwlVersion: v1.2
inputs:
  input: Directory
  example_argument_bool:
    default: true
    type: boolean
  example_argument_empty:
    default: null
    type: string
  example_argument_float:
    default: 1.0
    type: float
  example_argument_int:
    default: 1
    type: int
  example_argument_string:
    default: string
    type: string
  output_collection:
    default: example-app-collection___1
    type: string
  summary_table_filename:
    default: summary_table.txt
    type: string
outputs:
  output:
    outputBinding:
      glob: $(runtime.outdir)
    type: Directory
requirements:
  DockerRequirement:
    dockerPull: gangl/unity-ogc-example-application:174ee35b
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
  InlineJavascriptRequirement: {}
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
