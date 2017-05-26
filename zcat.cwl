baseCommand: zcat
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: gzipFile
  inputBinding: {position: 1}
  type: File
- {id: unzippedFileName, type: string}
outputs:
- {id: unzippedFile, type: stdout}
stdout: $(inputs.unzippedFileName)
