package mypack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class GetCategory extends TagSupport
{
	String displayType;			//attribute of my tag

	public String getDisplayType() {
		return displayType;
	}

	public void setDisplayType(String displayType) {
		this.displayType = displayType;
	}
	
	@Override
	public int doStartTag()
	{	//As this java file and not a servlet, we don't have response,session. So get it from the pageContext
		try {
				HttpSession session = pageContext.getSession();
				ServletResponse response = pageContext.getResponse();
				ServletContext application = pageContext.getServletContext();
				JspWriter out = pageContext.getOut();
				
				Connection con = (Connection) application.getAttribute("con");
				PreparedStatement ps =  con.prepareStatement("select * from category");
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())					
					{						
							if(displayType.equals("link"))  //user category
								{
									out.println("<a href='product.jsp?catid="+rs.getInt(1)+"'>"+rs.getString(2)+"</a>");		
								}
							if(displayType.equals("dropdown"))
								{
									
									out.println("<select name='categoryid'>");
										while(rs.next())
											{
													
										out.println("<option value='"+rs.getInt(1)+"'>");	
										out.println(""+rs.getString(2)+"");
										out.println("</option>");
											}
									out.println("</select>");
										
								}
							if(displayType.equals("admindropdown"))
							{
								
								out.println("<select name='categoryid' onchange='getProduct(this.value)''>");
									while(rs.next())
										{
												
									out.println("<option value='"+rs.getInt(1)+"'>");	
									out.println(""+rs.getString(2)+"");
									out.println("</option>");
										}
								out.println("</select>");
									
							}
					}
				} catch (SQLException e)
					{
					e.printStackTrace();
					} catch (IOException e)
					{
					e.printStackTrace();
					}
		return SKIP_BODY;
	}
	
@Override
	public int doEndTag()
		{
			return EVAL_PAGE;
		}
}
