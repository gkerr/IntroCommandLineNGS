Aligning RNASeq Reads
#####################################

Example 1 - arm.Xsubset.fastq
------------------------------

The dataset ``arm.Xsubset.fastq`` contains reads from an mRNA sample after RNAi knockdown of the arm gene, in the *Drosophila melanogaster* cell line, S2. The arm gene is found on chromosome X of the *Drosophila melanogaster* genome. Here, to save time, we will restrict our analysis to this chromosome. For your own projects, you should use all of the genome information.

Your task is to align the reads to the X chromosome. To align reads to the X chromosome, we can use a command line tool called **Tophat**.

To get information on **Tophat**, open a terminal window and type:

 ::
  
  > tophat -h 

You will find a file called ``arm.Xsubset.fastq`` in a folder called ``rawData`` in the course data folder. The data in the ``arm.Xsubset.fastq`` file is the raw data that you need to align to chromosome X.

The annotation data for chromosome X is in the file ``geneRef/drosophilaMelanogaster.X.gtf``

The bowtie index is ``bowtieIndexes/drosophilaMelanogaster.X``

Create an output directory where we can store the results of the alignment. Remember that you can create a new directory with the following command (see section :ref:`mkdir`).

 :: 

  > mkdir -p ~/arm_tohatOutput

We can use the following command to run **Tophat**, to perform an alignment of the NGS reads to the annotation data for chromosome X:

 ::

  > tophat --no-coverage-search -G geneRef/drosophila.2Lsubset.gtf -o ~/arm_tohatOutput/ \
    bowtieIndexes/drosophilaMelanogaster.X rawData/arm.Xsubset.fastq

.. note:: Remember to specify the output directory in the tophat command. 


.. topic:: Review questions

 - What does **Tophat** do?
 - What kind of aligner is **Tophat**?
 - What is the ``bowtie-index``?
 - How can specifying more mismatches with the ``-n`` option change the output?
 - Why supply a gtf file to **Tophat**?
 - option ``--no-coverage-search`` in the **Tophat** command will speed things up. Why?
 - What are the output files from the **Tophat** aligner?
 - Why assemble transcripts with cufflinks?
 - What is the gtf file and why do I need it?
 - What data does the gtf file contain?
 - What does the last column in the gtf file contain?



Example 2 - smo.2Lsubset.fastq 
--------------------------------

The dataset ``smo.2Lsubset.fastq`` contains reads from a mRNA sample after RNAi knockdown of the smo gene, in the *Drosophila melanogaster* cell line, S2. The smo gene is found on chromosome 2L of the *Drosophila melanogaster* genome. Once again we will restrict our analysis to a single chromosome.

Your task is to align the reads from the to the 2L chromosome

The raw data is called ``smo.2Lsubset.fastq`` and can be found in the ``rawData`` directory.

The annotation data for chromosome 2L is: ``geneRef/drosophilaMelanogaster.2L.gtf``

The bowtie index is ``bowtieIndex/drosophilaMelanogaster.2L``

Task
'''''

Which commands need to be run to align the reads to the 2L chromosome?

.. topic:: Review questions

 - What does the ``-p`` option in tophat do?
 - How does ``--no-coverage`` search save time?
 - What does the ``-g`` option do?

