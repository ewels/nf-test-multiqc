process get_data {
    container "gitpod/workspace-base"

    output:
    path 'data'

    """
    curl -LOJ https://multiqc.info/examples/rna-seq/data.zip
    unzip data.zip
    """
}
process multiqc {
    container "multiqc/multiqc:v1.21"

    input:
    path 'data'

    output:
    path 'multiqc_report.html'

    """
    multiqc .
    """
}

workflow {
    get_data | multiqc
}
