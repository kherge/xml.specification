Software Requirements Specification
===================================

This package contains an XML schema and a set of stylesheets for creating a
requirements specification as shown in [Applied Software Project Management][].
A big thank you to both [Andrew Stellman and Jennifer Greene][] for making the
[outline][] available online as a PDF!

What's inside
-------------

- Bootstrap 3.3.6
- jQuery 2.2.0
- XML Schema
- XML Stylesheets

What you need
-------------

- A modern browser than can render XML using XSL.
- Experiencing editing XML documents.
- Your all-time favorite XML editor.

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
structured very closely to how the PDF describes the specification should be
written.

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

License
-------

This package is released under the MIT license, so use, mangle, and share!

[Applied Software Project Management]: http://www.stellman-greene.com/about/applied-software-project-management/
[Andrew Stellman and Jennifer Greene]: http://www.stellman-greene.com/
[outline]: http://www.stellman-greene.com/images/stories/Library/SRS%20Outline.pdf
