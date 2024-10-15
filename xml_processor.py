from lxml import etree

# Load XML and XSLT files
with open('movies.xml', 'r') as xml_file:
    xml_content = xml_file.read()

with open('transform.xslt', 'r') as xslt_file:
    xslt_content = xslt_file.read()

# Parse the XML and XSLT
xml_doc = etree.XML(xml_content.encode('utf-8'))
xslt_doc = etree.XML(xslt_content.encode('utf-8'))
transform = etree.XSLT(xslt_doc)
 
transformed_html = transform(xml_doc)

# Save the transformed HTML to a file
with open('transformed_output.html', 'w') as output_file:
    output_file.write(str(transformed_html))

print("Transformation complete. Open 'transformed_output.html' to see the results.")


# Prompt user for XPath query
xpath_query = input("Enter XPath query ")

# Perform the XPath query
results = xml_doc.xpath(xpath_query)

# Display the results of the XPath query
print("\nXPath Query Results:")
if results:
    for result in results:
        # If result is an element, print its text content
        if isinstance(result, etree._Element):
            print(result.text if result.text else etree.tostring(result, pretty_print=True).decode('utf-8'))
        else:
            # If result is an attribute or text node, print it directly
            print(result)
else:
    print("No results found for the given query.")