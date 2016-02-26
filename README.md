Software Requirements Specification
===================================

This package contains an XML schema and a set of stylesheets for creating a
requirements specification as shown in [Applied Software Project Management][].
A big thank you to both [Andrew Stellman and Jennifer Greene][] for making the
[outline][] available online as a PDF!

Preview
-------

[Let's start off with a preview!][]

What's inside
-------------

- BASH Scripts
- Bootstrap 3.3.6
- jQuery 2.2.0
- PERL Scripts
- XML Schema
- XML Stylesheets

What you need
-------------

- A modern browser than can render XML using XSL.
- Experience editing XML documents.
- Your all-time favorite XML editor.
- `xmllint` if you want to use `tools/validate.sh`.
- PERL 5.8+ with `XML::LibXML` if you want to use `tools/fix-ids.pl`.

How it works
------------

An SRS is created by authoring an XML document which conforms to the included
XML schema. The XML document may then be opened in a browser and viewed as an
HTML page.

The magic all happens with the opening XML tags:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="styles/specification.xsl" type="text/xsl"?>
<specification
  xmlns="urn:kherge:specification"
  xmlns:x="http://www.w3.org/1999/xhtml"
>
```

The `xml-stylesheet` tag will render the specification using the included XML
stylesheets. The stylesheets generate Bootstrap 3 compatible HTML elements to
produce a responsive and printable web page.

The `xmlns="urn:kherge:specification"` will allow your editor to validate the
XML document using the schema in `schema/specification.xsd`. Your editor may
need to be configured to recognize the schema.

How to get started
------------------

### Preparing

I suggest you take a good look at the provided `example.xml` document. It makes
use of all of the elements that are defined by the schema. The XML tags are
structured very closely to how the PDF (linked to earlier) describes the
specification should be written.

In the example, you will notice some instances of XML elements being prefixed
with `x:`. The schema allows you to use HTML in nearly all instances of where
you provide information. Unfortunately due to limitations on how XML schemas
work, you need to prefix all of the HTML elements with `x:` (or whatever else
you used for the namespace).

### Authoring

You can use this template to start a new specification:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="styles/specification.xsl" type="text/xsl"?>
<specification xmlns="urn:kherge:specification" xmlns:x="http://www.w3.org/1999/xhtml">
  <project>
    <name>My Project</name>
  </project>
</specification>
```

With the included example specification and the XML schema, you should be able
to create a new specification in no time.

### Rendering

To view your specification, you are expected to use the following directory
structure:

    assets/
        ...
    schema/
        ...
    styles/
        ...
    mySpec.xml

> Your XML document could be named anything, not just `mySpec.xml`. For the
> sake of this tutorial, I will be using `mySpec.xml`.

You would then open `mySpec.xml` in your browser and see a fully rendered HTML
page. If you just see a mess of text, it is likely that your browser does not
support rendering XML documents using the file system. If this is the case, you
will need to make the files accessible through a web server and access the XML
document as a web page. If this also does not work, you will need to run your
XML document through an XSL processor and save the result as an HTML file in
the same directory.

#### Printing

Firefox is the best browser to use if you need to print your specification.

Tests done on Safari and Chrome have shown that the page dimensions are not
calculated correctly. As a result, you may see that the table of contents
continues down the left side instead taking up the full width of the page.
You may also notice that page breaks do not work properly after the title
page.

### Tools

### `fix-ids.pl`

As you write your specification, you may need to re-arrange some use cases or
requirements. Going back and renumbering everything can become a real pain! To
avoid doing this, leave all of the numbers alone and then run `fix-ids.pl`.

    tools/fix-ids.pl mySpec.xml

### `next-ids.pl`

Like before, you may rearrange use cases or requirements and end up losing
track of which number comes next. The `next-ids.pl` tool will display the
next available number for use cases and requirements.

    tools/next-ids.pl mySpec.xml

### `validate.sh`

If you want to ensure that your specification will render correctly, you will
want to occassionally validate your XML document and fix any changes that you
may encounter. To find problems, run the `validate.sh` tool.

    tools/validate.sh mySpec.xml

License
-------

This package is released under the MIT license, so use, mangle, and share!

[Let's start off with a preview!]: https://cdn.rawgit.com/kherge/srs/f4f857aadfae8c47b9491c80ca875a216e142e3f/example.xml
[Applied Software Project Management]: http://www.stellman-greene.com/about/applied-software-project-management/
[Andrew Stellman and Jennifer Greene]: http://www.stellman-greene.com/
[outline]: http://www.stellman-greene.com/images/stories/Library/SRS%20Outline.pdf
