
Exercises
=========

Misc. file tools
----------------

#. Which tool can be used to determine the type of a file?
#. Use it on the following files/directories and compare the results:

   A. ``/usr/bin/tail``
   B. ``~``
   C. ``~/exercises/SRC_HUMAN.fasta``

Extracting Information from Files
---------------------------------

#. Which simple command can you use to display just the first 10 lines of a textfile (eg. ~/exercises/P12931.csv)?
#. Using the same tool, how can you display the first *20* lines?
#. Read the manpage of that command to find out what you need to type to display the first 100 *bytes* of a textfile.
#. How can you display the *last* 20 lines?

Searching
---------
#. Which tool can be used to search for files or directories?
#. Use it to list all directories in the ``~/exercises`` directory
#. Search for the file ``date`` in the ``/bin`` directory
#. List those entries in the directory ``/bin`` that are bigger than 400kBytes

Misc. terminal
--------------
#. Which two tools can be used to redraw/empty the screen?

Permissions
-----------
#. Create a directory called testpermissions (in your homedirectory)
#. Change your working directory to this new directory
#. In there, create another directory called adir.
#. Use the command ``which date`` to find out where the date program is located.
#. Copy this date program into the directory adir.
#. Check the permissions of the copied program date
#. Change your permissions on date to remove the executable permissions.
#. Check the permissions of the program date
#. Try running it as ``./date`` or ``adir/date`` (depending on your current working directory)
#. Change the permissions back so that the file is executable.
#. Try running it as ``./date`` or ``adir/date`` (depending on your current working directory)
#. Copy a textfile from a previous exercise into adir, then change the permissions, so you are not allowed to write to it.
#. Then change the permissions so you can't read/cat it either.
#. Change your working directory to testpermissions, and then try changing the permissions on adir.
#. What are the minimum permissions (on the directory) necessary for you to be able to execute ``adir/date``?

.. Remote access
.. -------------
.. #. Login to machine "sub-master.embl.de" (using your own username)
.. #. Use exit to quit the remote shell (Beware to not exit your local shell)
.. #. Use clear to empty the screen after logout from the remote server
.. #. Use the following commands locally as well as on the remote machine to get a feeling for the different machines:
.. 
..   a) ``hostname``
..   b) ``whoami``
..   c) ``cat /etc/hostname``
..   d) ``ls -la ~/``
.. 
.. #. Copy the file ``/etc/motd`` from machine sub-master.embl.de into your local home directory
.. #. Determine the filetype and the permissions of the file that you just copied
.. #. Login to your neighbor's machine (ask them for the hostname) using the username ``teach01`` (password will be given by teacher)

IO and Redirections
-------------------
#. Use ``date`` in conjuction with the redirection to insert the current date into the (new) file *current_date* (in your homedirectory).
#. Inspect the file to make sure it contains (only a single line with) the date.
#. Use ``date`` again to append the current date into the same file.
#. Again, check that this file now contains two lines with dates.
#. Use ``grep`` to filter out lines containing the term "TITLE" from all PDB files in the exercises directory and use redirection to insert them into a new file pdb_titles.txt.
#. (OPTIONAL) Upon inspection of the file pdb_titles.txt, you see that it also contains the names of the files in which the term was found. 
   Use either the grep manpage or ``grep --help`` to find out how you can suppress this behaviour. 
   Redo the previous exercise such that the output file pdb_titles.txt only contains lines starting with TITLE.

