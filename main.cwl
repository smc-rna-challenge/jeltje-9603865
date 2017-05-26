class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': jeltje@synapse.org,
  'foaf:name': jeltje}
doc: 'SMC-RNA challenge isoform quantification submission

  '
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: cut/cutfile, type: File}
requirements:
- {class: MultipleInputFeatureRequirement}
- {class: StepInputExpressionRequirement}
- {class: InlineJavascriptRequirement}
steps:
- id: cut
  in:
  - {id: cutfile, valueFrom: $('TPM.txt')}
  - {id: infile, source: kallisto/isoforms}
  out: [cutfile]
  run: cut.cwl
- id: kallisto
  in:
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {id: index, source: zcat/unzippedFile}
  out: [isoforms]
  run: kallisto.cwl
- id: zcat
  in:
  - {id: gzipFile, source: index}
  - {id: unzippedFileName, valueFrom: $('SMCRNA_DREAM2017_kallisto.idx')}
  out: [unzippedFile]
  run: zcat.cwl
