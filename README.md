<tt>README.md</tt>
==================

This is a directory for writing documents formatted using
[Markdown][md-main] and styled using a slightly modified version of
[`markdown.css`][md-css].  The main markdown to HTML conversion script
can be found here: [Markdown_1.0.1.zip][md-script].

Build Process
-------------

This directory also contains a make file `Makefile`.  The make file's
`build` target applies the following transformation to all files
ending with a `.md` suffix.

                                          file.html
                                      +----------------+
    "<style>" ----------------------> | <style>        |
                                      +----------------+
    [ markdown.css ] ----(cat)------> | css stuff      |
                                      +----------------+
    "</style>" ---------------------> | </style>       |
                                      +----------------+
    [ file.md ] --> (Markdown.pl) --> | generated HTML |
                                      +----------------+

Creating a new Document
-----------------------

To create a new document, use a text editor to create a `.md` file
within the directory.  Once the file exists, running `make` will
create a HTML file in the manner described above.  View the HTML file
using a browser.

Custom Styling
--------------

Custom styling for the document is possible.  Simply include a STYLE
block within `.md` file that requires styling; since this comes
_after_ the styling provided by `markdown.css`, they override what has
been specified before.  As a demonstration, this document includes the
following which applies some customization to text within HTML CODE
blocks.

    <style>
    code {
      font-family: courier;
      color: #080;
    }
    </style>

<style>
code {
  font-family: courier;
  color: #080;
}
</style>

Untabify
--------

The number of spaces or tabs at the start of a line is quite important
when it comes to code and lists.  For example, a code line is a line
that is indented four spaces or one tab _from the expected indentation
of a normal line_.  Mixing tabs and spaces may lead to unexpected
results so there is reason to avoid use of tabs entirely.  That being
said, it is more convenient to write pseudo code using tabs for
indentation.  Thus the make file includes an alternative built step
that inserts an untabify filter into `.md` to HTML convertion step.

                                       +----------------+
    [ file.md ]      (Markdown.pl) --> | generated HTML |
       |                    ^          +----------------+
       |                    |
       '-- (perl -pe ...) --'

Alternatively, Emacs provides an untabify command.  To use it:

  1. Select a region to unabify.
  2. Execute command `M-x untabify`

This may however leave trailing spaces at the right side of line.  To
remove those simply use regular expresion replacement from the top of
the file as follows:

  1. Execute command `M-x replace-regexp`
  2. Provide as regular expression: '`\ +$`' (i.e. slash space plus dollar)
  3. Provide as replacement an empty string


Acknowledgements
----------------

The `Markdown.pl` script was obtained from [John Gruber's][md-main]
Daring Fireball site and the `markdown.css` was obtained from [Kevin
Burke][md-css-site].

[md-main]: http://daringfireball.net/projects/markdown/
[md-script]: http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
[md-css-site]: http://kevinburke.bitbucket.org/markdowncss
[md-css]: http://kevinburke.bitbucket.org/markdowncss/markdown.css

