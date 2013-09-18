SAMtools
#####################################


**SAMtools** is a set of scripts (a toolbox so to say) that can be used to manipulate and view sam/bam files. In particular you can: ``sort``, ``index``, ``merge``, and ``view`` these files.

There is more information available on the **SAMtools** websites

- http://samtools.sourceforge.net/
- http://samtools.sourceforge.net/samtools-c.shtml
- http://samtools.sourceforge.net/samtools.shtml

**Getting help**

To print a list of all the tools available in the samtools suite, simply type ``samtools`` on the command line

 ::
 
  > samtools

To print a list of the parameters required and options available for each tool in the suite, simply type ``samtools`` followed by the name of the tool on the command line. For example, to get a list of the options available for the ``view`` tool in the samtools suite, simply type:

 ::
 
  > samtools view

View bam files
'''''''''''''''''''''''''''''''''

``smo.bam`` is a bam file and is not human readable. To make it human readable you can convert it to a sam file.

 ::

   > samtools view -h -o ~/smo.sam rawData/smo.bam

- What does ``-h`` and ``-o`` do in the above example?
- Convert ``arm.bam`` into a sam file.
- Use the ``samtools view`` (and read the help) to view a specific region e.g. all reads mapping to chromosome X


Viewing the header of a bam file
'''''''''''''''''''''''''''''''''

In some cases you might only want to see or generate the header of a bam file.

 ::
 
  > samtools view -H rawData/smo.bam

Now try:

 ::
 
  > samtools view -H rawData/smo.bam > ~/smo.header.sam

- What does the ``> ~/smo.header.sam`` of the above statement do?
- What information is stored in the header of the sam file?
- From the header of the file, can you tell which alignment program was used to generate the bam file


Count the number of alignments in a bam file
'''''''''''''''''''''''''''''''''''''''''''''''

 ::
  
  > samtools view -c rawData/smo.bam


- Can you use samtools to count the number of alignments above a quality score of 20 in your file?
- What does the quality score of an alignment indicate?
- How many alignments are in the ``arm.bam`` above a quality score of 50
- What other flags/filtering options are there?


Create a bam index
'''''''''''''''''''''''''''''''''

Use ``samtools index`` to create an index of ``smo.bam``

Get help

 ::
   
   > samtools index

Note the usage of the index command in the samtools toolbox suite.

 ::
 
   > samtools index rawData/smo.bam smo.bai

- Does the above command work as written? If not, what do you need to change?
- What does creating a bam index mean? 
- Why would one want to create a bam index?


Sorting the sam file
'''''''''''''''''''''''''''''''''

 ::
  
  > samtools sort rawData/smo.sam 

- What does ``-o`` in the above command do?
- Change the command to sort by read names rather than chromosomal locations.
- Change the above command so that the sorted reads are outputted to ``smo.sorted.bam``


Merging sam files
'''''''''''''''''''''''''''''''''

``Fl1-1.bam`` and ``FL1-2.bam`` are two technical replicates of the one control sample FL1. We would like to merge these two sam files.

Getting help

 :: 
 
   > samtools merge
   
Note the usage and run the command

 ::

  > samtools merge -h header.sam ~/FL1-merged.bam rawData/FL1-1.bam rawData/FL1-2.bam

- What does ``-h`` in the above command do?
- Does this command work? If not, why not? What command can allow the files to be merged.


Get summary statistics
'''''''''''''''''''''''''''''''''

Use ``samtools idxstats`` to get summary statistics for the aligned file. Use the help.


Create a fasta file index
'''''''''''''''''''''''''''''''''

 ::
  
  > samtools faidx genome/dros_BDGP5.25.fa

- What is the benefit of creating an index of a fasta file?
- Does this command work? Why not?


Create a pileup
'''''''''''''''''''''''''''''''''

``samtools mpileup`` is a very useful utility for calling variants in alignment files. Read the help documentation carefully. 

 .. warning:: This command is slow.


 ::
 
  > samtools mpileup -g -l intervalFile.bed -I -D -q 20 -f genome/dros_BDGP5.25.fa rawData/arm.bam

.. note:: ``dros_BDGP5.25.fa`` needs to be indexed otherwise the above command will not work



Getting bored? Good to know...
'''''''''''''''''''''''''''''''''

**Working with the stream**
You can take the output of one command from the “standard stream” and pipe (see section :ref:`pipe`) it as input to another samtools command. 

 ::

   > samtools view -u arm.bam chrX | samtools pileup -cf dros_BD5.25.fa -

What exactly does the above command do?

Use ``samtools`` and ``awk`` to count the number of mapped reads in your file.

 ::
 
   >  samtools idxstats rawData/smo.bam | awk '{s+=$3} END {print s}' 

- Do you get the same number of mapped reads as with ``samtools view -c smo.bam``
- What is the ``awk`` command doing in the above command?
