Quality Control
#####################################

In this section you will need to use the following three files:
-------
- data/arm.fastq
- data/arm.bam
- data/FL1-1.sam

As a reminder, you can find out what each of these files is used for here.

One of the most important steps before spending lots of time on an analysis, is to check that the raw data from the sequencing run is of good enough quality. We will use a tool called fastqc to do some preliminary quality control of our raw data. The fastqc tool generates summary statistics of sequence and quality data and can be used to filter, reformat and trim next-generation sequence data.

Make a directory in your home directory called ``fastqcTest``.

Recall, that when we don't know what a tool does, we can always get help (see section :ref:`help`:

 :: 

  fastqc -h

Report graphs allow us to gain a visual overview of the sequence data. To generate report graphs type the following:

 :: 

  fastqc -verbose –o fastqcTest –noextract –f fastq arm.fastq -


SAMStat is an efficient C program to quickly display statistics of large sequence files from next generation sequencing projects. When applied to SAM/BAM files all statistics are reported for unmapped, poorly and accurately mapped reads separately. This allows for identification of a variety of problems, such as remaining linker and adaptor sequences, causing poor mapping. Apart from this SAMStat can be used to verify individual processing steps in large analysis pipelines.

Use samstat to get statistics on the mapped data file in 

 smo.bam and FL1-1.sam



adgadfgv
