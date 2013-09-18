Before you start
################

You need to tell your computer where to find the programs we will use:

 ::

  > export PATH=/net/netfile1/ds-russell/linuxForNGS/bin:$PATH

All the course data can be found in the following directory:

 ::

  /net/netfile1/ds-russell/linuxForNGS/data

Note that you do not have permission to write to this directory.

Quality Control
#####################################

In this section you will need to use the following three files:
-------
- rawData/arm.fastq
- rawData/arm.bam
- rawData/FL1-1.sam

As a reminder, you can find out what each of these files is used for here.

One of the most important steps before spending lots of time on an analysis, is to check that the raw data from the sequencing run is of good enough quality. We will use a tool called fastqc to do some preliminary quality control of our raw data. The fastqc tool generates summary statistics of sequence and quality data and can be used to filter, reformat and trim next-generation sequence data.

Make a directory in your home directory called ``fastqcTest``.

Recall, that when we don't know what a tool does, we can always get help (see section :ref:`help`):

=======
FastQC
---------

We will use a tool called **fastqc** to do some preliminary quality control of our raw data. This is a tool that generates summary statistics of sequence and quality data and can be used to filter, reformat and trim next-generation sequence data.


Use your linux know how to make a directory in your home directory called fastqcTest.

Get help on how to use fastqc

 :: 

  > fastqc -h

Report graphs allow us to gain a visual overview of the sequence data. To generate report graphs type the following:

=======
To generate an html report use the following:

 :: 

  > fastqc -o ~/fastqcTest -noextract -f fastq rawData/arm.fastq

.. topic:: Review Questions
  
  - What does the option ``-o`` do in the above command?
  - Does the ``-o`` option have a value associated with it?
  - What does the -noextract option do? What is the difference between the -o option and the -noextract option?
  
Task
'''''
Use fastqc to generate a report of rawData/smo.fastq. Save the report in an output directory called fastqcSMO

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


To get the statistics of the arm.bam file using samstat. This will try to create a html report file in the same directory as the input file.

 ::
   
   > samstat rawData/arm.bam

The above command will not work as written. Can you figure out why and fix it?

Task
'''''''

Use samstat to create html report for ``rawData/arm.fastq`` and ``rawData/FL1-1.sam``

