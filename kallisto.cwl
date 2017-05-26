arguments:
- {position: 10, valueFrom: $(inputs.fastq1)}
- {position: 11, valueFrom: $(inputs.fastq2)}
baseCommand: [kallisto, quant]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- {id: fastq1, type: File}
- {id: fastq2, type: File}
- default: true
  id: fusion
  inputBinding: {prefix: --fusion}
  type: boolean
- id: index
  inputBinding: {prefix: --index}
  type: File
- default: ./
  id: output-dir
  inputBinding: {prefix: --output-dir}
  type: string
- default: true
  id: plaintext
  inputBinding: {prefix: --plaintext}
  type: boolean
- default: 8
  id: threads
  inputBinding: {prefix: --threads}
  type: int
outputs:
- id: isoforms
  outputBinding: {glob: abundance.tsv}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: jeltje/kallisto}
