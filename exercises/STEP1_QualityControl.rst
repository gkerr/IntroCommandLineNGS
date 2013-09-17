Quality Control
#####################################

Data:
-------
- arm.fastq
- arm.bam
- FL1-1.sam


FastQC
---------

We will use a tool called **fastqc** to do some preliminary quality control of our raw data. This is a tool that generates summary statistics of sequence and quality data and can be used to filter, reformat and trim next-generation sequence data.


Use your linux know how to make a directory in your home directory called fastqcTest.

Get help on how to use fastqc

 :: 

  > fastqc -h

To generate an html report use the following:

 :: 

  > fastqc -verbose –o fastqcTest –noextract –f fastq arm.fastq -

.. topic:: Review Questions
  
  - What does the option ``-o`` do in the above command?
  - Does the ``-o`` option have a value associated with it?
  - What does the -noextract option do? What is the difference between the -o option and the -noextract option?
  
Task
'''''
Use fastqc to generate a report of smo.fastq

SAMstat
---------

SAMStat is an efficient C program to quickly display statistics of large sequence files from next generation sequencing projects. When applied to SAM/BAM files all statistics are reported for unmapped, poorly and accurately mapped reads separately. This allows for identification of a variety of problems, such as remaining linker and adaptor sequences, causing poor mapping. Apart from this SAMStat can be used to verify individual processing steps in large analysis pipelines.

Use samstat to get statistics on the mapped data file in `arm.fastq` and `arm.bam`

**Getting help**

 ::
 
   > samstat -h
 
Note the usage line you are given after typing this

 ::
 
   Usage:   samstat <file.sam> <file.bam> <file.fa> <file.fq> .... 


To get the statistics of the arm.bam file using samstat. This will create a html report in the current working directory

 ::
   
   > samstat arm.bam

Task
--------
Use samstat to create html report for ``arm.fastq`` and ``FL1-1.sam``

