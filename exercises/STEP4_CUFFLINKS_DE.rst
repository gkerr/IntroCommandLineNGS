Estimating Expression  
========================


Example - Expression in the *arm* gene knockdown sample
----------------------------------------------------------

We have used reads sequences obtained from a knockdown of the *arm* and *smo* gene in the *Drosophila* S2 cell line to estimate gene expression. Previously we used **Tophat** to align a subset of these reads. To perform a proper analysis of the data, it is necessary to align the reads to the complete genome, however, this is a time-consuming process, so in the following example we use pre-prepared **Tophat** output. To remind yourself about running **Tophat** you can review the information in step 2 (see :ref:`tophat`). To look at gene expression in the pre-prepared samples, we will use a program called **Cufflinks**.

Let's first, take the *arm* gene knockdown sample and assemble expressed genes and transcripts in the *arm* knockdown with **Cufflinks**
	
To get help

 ::

  cufflinks -h

Note the output of the help command

 ::
 
  Usage: cufflinks [options]* <aligned_reads.(sam/bam)> 
  
The pre-prepared output files from **Tophat** can be found in the course data folder ``ARM-1_tophatOutput/accepted_hits.q20.sam``. If you had aligned the reads to a full genome in step 2, you would have found the file in ``arm_tophatOutput``.
	 
Again, we'll need the annotation data from the file ``geneRef/dros_BDGP5.25.gtf``

Run the command:

 ::
 
  cufflinks -G geneRef/dros_BDGP5.25.gtf --upper-quartile-norm \
  --compatible-hits-norm -p 2 -o ~/ARM-1_CufflinksOutput \
  ARM-1_tophatOutput/accepted_hits.q20.sam
	
.. topic:: Review Questions:

 - Why assemble transcripts with **Cufflinks**?
 - What do the options in the **Cufflinks** command do?
 - What is the gtf file and why do I need it?
 - what data does the gtf file contain?
 - what does the last column in the gtf file contain?
 - what is the ``tss_id`` tag in the gtf file and what is it used for?
 - why is both transcript and gene information in the gtf file?
 - Which files does **Cufflinks** output, and what do the columns in the files mean?


Next, we must estimate the expression in the *smo* gene knockdown:

Task 
----------

Assemble expressed genes and transcripts in the *smo* knockdown with **Cufflinks** (similar to above)

Pre-prepared output from **Tophat** for the *smo* knockdown experiments can be found in the course data folder at ``SMO-1_tophatOutput/accepted_hits.q20.sam``



Estimating differential Expression
=============================================

Example - Estimating significance of differential expression in the *arm* gene knockdown compared to control
-------------------------------------------------------------------------------------------------------------

We have estimated gene expression in *arm* and *smo* gene knockdowns. We would now like to see if this is expressed differently with respect to a control. We will now use the output from **Cufflinks**, to look at differential gene expression by comparing it to a control. We will use a program called **Cuffdiff** to do this.

.. important:: To save time we have aligned and pre-calculated gene expression in the control samples

There is 1 replicate of the ARM sample: ``ARM-1``
There are 2 replicates of the control sample: ``FL1-1``, ``FL2-1``

Use the *Drosophila* gtf file ``geneRef/dros_BDGP5.25.gtf``

Use the ``accepted_hits.bam`` output from the **Tophat** alignment. For the *arm* samples this is ``ARM-1_tophatOuput/accepted_hits.q20.sam``

For the control sample these are ``FL1-1_tophatOutput/accepted_hits.q20.sam``, and ``FL2-1_tophatOutput/accepted_hits.q20.sam``

 ::
 
  cuffdiff -o ~/ARM_vs_CTRL_diffOut -b genome/dros_BDGP5.25.fa -p 8 \ 
  -L FL1_ctrl,arm  -u geneRef/dros_BDGP5.25.gtf \
  FL1-1_tophatOutput/accepted_hits.q20.sam,\
  FL2-1_tophatOutput/accepted_hits.q20.sam \
  ARM-1_tophatOutput/accepted_hits.q20.sam

 
.. topic:: Review Questions:

  - What is normalization?
  - What normalization strategies are available with **Cuffdiff**?
  - What is the ``-L`` option for?
  - Why are replicates important here?
  - What are the output files from **Cuffdiff**?

Use your linux know how
-------------------------------
- How many significantly differentially expressed genes are there?
- Can you find the expression of gene ``CG7224``?

Task 
-------
Use your know-how to estimate estimate differential expression in the *smo* knockdown compared to the control.

The output can be found at: ``SMO-1_tophatOuput/accepted_hits.q20.sam``

The controls and other input files are the same as before.

