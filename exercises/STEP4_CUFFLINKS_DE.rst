Estimating Expression  
========================


Example - Expression in the arm gene knockdown sample
----------------------------------------------------------

We have used reads sequences obtained from a knockdown of the *arm* and *smo* gene in the drosophila S2 cell line to estimate gene expression. We used tophat to align the reads.  We will now use the output from the tophat step, to look at gene expression in these samples. We will use a program called **Cufflinks** to do this.

Let's first, take the arm gene knockdown sample and assemble expressed genes and transcripts in the ARM knockdown with CUFFLINKS
	
To get help

 ::

  cufflinks -h

Note the output of them help command

 ::
 
  Usage: cufflinks [options]* <aligned_reads.(sam/bam)> 
  
The type abd position of *required* arguments to the cufflinks programs and in angular brackets "< >", while *optional* arguments are in square "[]" brackets.

The output of tophat in step 1 can be found in the course dat folder at ``ARM-1_tophatOutput/accepted_hits.bam``
	 
The annotation Data is ``geneRef/dros_BD5.25.gff``

Run the command:

 ::
 
  cufflinks -G geneRef/dros.gtf --upper-quartile-norm --compatible-hits-norm -p 2 -o ~/ARM-1_CufflinksOutput ARM-1_tophatOutput/accepted_hits.bam
	
Review Questions:
---------------------

- Why assemble transcripts with cufflinks?
- What do the options in the cufflinks command do?
- What is the gtf file and why do I need it?
- what data does the gtf file contain?
- what does the last column in the gtf file contain?
- what is the "tss_id" tag in the gtf file and what is it used for?
- why is both transcript and gene information in the gtf file?
- What files does cufflinks output and what do the columns mean?


Next, we must estimate the expression in the smo gene knockdown:

Task 
----------

Assemble expressed genes and transcripts in the SMO knockdown with CUFFLINKS (similar to above)

The output of tophat in step 1 can be found in the course data folder at ``SMO-1_tophatOutput/accepted_hits.bam``



Estimating differential Expression
=============================================

Example - Estimating significance of differential expression in the ARM gene knockdown compared to control.
----------------------------------------------------------------

We have estimated gene expression in SMO and ARM gene knockdowns. We would now like to see if this is expressed differently as one would find in a control. We will now use the output from the cufflinks step, to look at differential gene expression by comparing it to a control. We will use a program called Cuffdiff to do this.

(To save time we have aligned and pre-calculated gene expression in the control samples)

There is 1 replicate of the ARM sample: ARM-1
There are 2 replicates of the CTRL sample: FL1-1, FL2-1


Use the drosophila gtf file ``geneRef/dros_BDGP5.25.gtf``

Use the ``accepted_hits.bam`` output from the tophat alignment 
	  
For ctrl these are:

- ``FL1-1_tophatOutput/accepted_hits.bam``
- ``FL2-1_tophatOutput/accepted_hits.bam``

And for ARM these are:``ARM-1_tophatOuput/accepted_hits.bam``

 ::
 
  cuffdiff -o ~/ARM_vs_CTRL_diffOut -b genome/dros_BDGP5.25.fa -p 8 –L FL1_ctrl,arm -u geneRef/dros_BDGP5.25.gtf  FL1-1_tophatOutput/accepted_hits.bam, FL2-1_tophatOutput/accepted_hits.bam ARM-1_tophatOuput/accepted_hits.bam

 
.. topic:: Review Questions:

  - What normalization strategies are available with cuffdiff?
  - What is the -L option for?
  - Why are replicates important here?
  - What are the output files from cuff_diff?

Use your linux know how
-------------------------------
- How many significantly differentially expressed genes are there?
- Can you find the expression of gene "CG7224"?

Task 
-------
Use your know-how to estimate estimate differential expression in the smo knockdown compared to control.

The output can be found at: ``SMO-1_tophatOuput/accepted_hits.bam``

The controls and other input files are as before.

