<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<! DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv = "Content-Type" content="text/html;charset=ISO-8859-1" />
        <style type="text/css">
        </style>
        <title>Sorting Items</title>
    </head>

    <body>
        <big><u><b>Advanced Search</big></u></b><br /><br />
        <form action="browsed.jsp"method="post">
            <b>Keywords:</b><br />
            <textarea cols=40 rows=10 name="keywords" placeholder = "Enter keywords separated by commas..."></textarea><br /><br />

            <b>Colors:</b><br />
            <textarea cols=20 rows=1 name="colors" placeholder = "Enter colors..."></textarea><br /><br />

            <b>Bidding Range:</b>
                <select name="selectinput">
                    <option value="less10">under $10</option>
                    <option value="tenThirty">$10-$30</option>
                    <option value="thirtyFifty">$30-$50</option>
                    <option value="above50">above $50</option>
                </select>
                <input type="submit" value="Sort"/><br /><br />
          </form
          <form action="mainPage.jsp" method="post">
              <input type="submit" value="Return to Main"/>
          </form>
      </body>
</html>
