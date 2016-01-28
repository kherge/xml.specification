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

I suggest you take a good look at the provided `example.xml` document. It makes
use of all of the elements that are defined by the schema. The XML tags are
structured very closely to how the PDF describes the specification should be
written.

In the example, you will notice some instances of XML elements being prefixed
with `x:`. The schema allows you to use HTML in nearly all instances of where
you provide information. Unfortunately due to limitations on how XML schemas
work, you need to prefix all of the HTML elements with `x:` (or whatever else
you used for the namespace).

License
-------

This package is released under the MIT license, so use, mangle, and share!

[Applied Software Project Management]: http://www.stellman-greene.com/about/applied-software-project-management/
[Andrew Stellman and Jennifer Greene]: http://www.stellman-greene.com/
[outline]: http://www.stellman-greene.com/images/stories/Library/SRS%20Outline.pdf
