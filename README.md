Filtlong is a tool for filtering long reads by quality. It can take a set of long reads and produce a smaller, better subset. It uses both read length (longer is better) and read identity (higher is better) when choosing which reads pass the filter.

When you run Filtlong without an external reference, it judges read quality using the Phred quality scores in the FASTQ file.