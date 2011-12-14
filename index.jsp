<%@ page language="java" %>
<%@page import="org.w3c.dom.Document" %>
<%@page import="org.w3c.dom.*" %>
<%@page import="javax.xml.parsers.DocumentBuilder" %>
<%@page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

<head>
<title>Shopping Form</title>
</head>

<body>
<center>
<% String inputfile = application.getRealPath("/" + request.getParameter("catalog.xml"));
    inputfile = inputfile.substring(0,inputfile.length()-4).concat("catalog.xml/");
    DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
    Document doc = docBuilder.parse(inputfile);
%>



<form method="POST">

<h1>Shopping Cart</h1>
<table border="0" cellpadding="0" cellspacing="0" width="200">
<tr>
                <th>Item</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>SubTotal</th>
</tr>

            <%
	    double total = 0;
            for(int i=0; i<3; i++){
                NodeList nameNlc = doc.getElementsByTagName("name");
                Element nameElements = (Element)nameNlc.item(i);
                String nameTagValue = nameElements.getChildNodes().item(0).getNodeValue();
                
                NodeList priceNlc = doc.getElementsByTagName("price");
                Element priceElements = (Element)priceNlc.item(i);
                String priceTagValue = priceElements.getChildNodes().item(0).getNodeValue();

                out.println("<tr>");
                out.println("<td>"+nameTagValue+"</td>");
                out.println("<th>"+priceTagValue+"</th>");
		double subtotal = 0;
		double price = Double.parseDouble(priceTagValue);
		if(i==0){
			out.println("<td><input type=\"text\" name=\"Camount\" size=\"5\"></td>");
			
			if (request.getParameter("Camount")!=null&& !request.getParameter("Camount").isEmpty()){
				subtotal= Double.parseDouble(request.getParameter("Camount"));
                        }
		}
		if(i==1){
			out.println("<th><input type=\"text\" name=\"Samount\" size=\"5\"></th>");
			
			if (request.getParameter("Samount")!=null&& !request.getParameter("Samount").isEmpty()){
				subtotal= Double.parseDouble(request.getParameter("Samount"));
                        }
		}
		if(i==2){
			out.println("<th><input type=\"text\" name=\"Wamount\"size=\"5\"></th>");
		
			if (request.getParameter("Wamount")!=null&& !request.getParameter("Wamount").isEmpty()){
				subtotal= Double.parseDouble(request.getParameter("Wamount"));
                        }
		}
		subtotal = subtotal*price;
		total = total+subtotal;
                out.println("<th>"+subtotal+"</th></tr>");
            }
 %>
<tr>
                <th>TOTAL</th>
                <th></th>
                <th></th>
                <th><%=total%></th>
</tr>


<tr>
	<td width="50%" colspan="2" align="center">
		<input type="submit"  value="submit" size="16">
	</td>
</tr>
</table>
</center>

</form>

</body>

</html>

