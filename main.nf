#!/usr/bin/env nextflow

process FILTLONG{
	//filtering long reads
	//cpus 160
	publishDir params.out_dir, mode: 'copy'

	container 'community.wave.seqera.io/library/filtlong:0.2.1--5cb367f8dffa9e28' 

	input:
	path(reads_file)
	
	output:
	path("filtered_${reads_file}")

	script:
	"""
	filtlong --min_length ${params.min_length} --keep_percent ${params.keep_percent} --target_bases ${params.target_bases} ${reads_file} | gzip > filtered_${reads_file}
	
	cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        filtlong: \$( filtlong --version | sed -e "s/Filtlong v//g" )
    END_VERSIONS
	"""

}


workflow {
	reads=Channel.fromPath("${params.input}/*.fastq.gz", type: "file")

	FILTLONG(reads)
	
}


