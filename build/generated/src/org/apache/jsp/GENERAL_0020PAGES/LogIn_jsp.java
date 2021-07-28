package org.apache.jsp.GENERAL_0020PAGES;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LogIn_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link href=\"https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css\" rel=\"stylesheet\">\n");
      out.write("        <title>Log In | Voting Rush</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- component -->\n");
      out.write("        <div class=\"bg-gray-50 min-h-screen flex flex-col\">\n");
      out.write("            <div class=\"container max-w-sm mx-auto flex-1 flex flex-col items-center justify-center px-2\">\n");
      out.write("                <div class=\"bg-white px-6 py-8 rounded shadow-md text-black w-full\">\n");
      out.write("                    <div>\n");
      out.write("                        <img class=\"mx-auto h-12 w-auto\" src=\"https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg\" alt=\"Workflow\">\n");
      out.write("                        <h2 class=\"mt-6 text-center text-3xl font-extrabold text-gray-900\">\n");
      out.write("                            Sign into \n");
      out.write("                            <span class=\"font-extrabold text-indigo-600\">Account</span>\n");
      out.write("                        </h2>\n");
      out.write("                    </div>\n");
      out.write("                    <form class=\"mt-8 space-y-6\" action=\"");
      out.print(request.getContextPath());
      out.write("/vmController\" method=\"POST\">\n");
      out.write("                        <input type=\"hidden\" name=\"remember\" value=\"true\">\n");
      out.write("                        <div class=\"rounded-md shadow-sm -space-y-px\">\n");
      out.write("                            <div>\n");
      out.write("                                <label for=\"email-address\" class=\"sr-only\">Email address</label>\n");
      out.write("                                <input id=\"email-address\" name=\"email\" type=\"email\" autocomplete=\"email\" required class=\"appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm\" placeholder=\"Email Address\">\n");
      out.write("                            </div>\n");
      out.write("                            <br>\n");
      out.write("                            <div>\n");
      out.write("                                <label for=\"password\" class=\"sr-only\">Password</label>\n");
      out.write("                                <input id=\"password\" name=\"password\" type=\"password\" autocomplete=\"current-password\" required class=\"appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm\" placeholder=\"Password\">\n");
      out.write("                            </div>\n");
      out.write("                        </div>            \n");
      out.write("                        <div class=\"flex items-center justify-between\">\n");
      out.write("                            <div class=\"flex items-center\">\n");
      out.write("                                <input id=\"remember_me\" name=\"remember_me\" type=\"checkbox\" class=\"h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded\">\n");
      out.write("                                <label for=\"remember_me\" class=\"ml-2 block text-sm text-gray-900\">\n");
      out.write("                                    Remember me\n");
      out.write("                                </label>\n");
      out.write("                            </div>\n");
      out.write("                    \n");
      out.write("                            <div class=\"text-sm\">\n");
      out.write("                                <a href=\"#\" class=\"font-medium text-indigo-600 hover:text-indigo-500\">\n");
      out.write("                                    Forgot your password?\n");
      out.write("                                </a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div>\n");
      out.write("                            <button type=\"submit\" name = \"command\" value = \"signin\" class=\"group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500\">\n");
      out.write("                                <span class=\"absolute left-0 inset-y-0 flex items-center pl-3\">\n");
      out.write("                                    <!-- Heroicon name: solid/lock-closed -->\n");
      out.write("                                    <svg class=\"h-5 w-5 text-indigo-500 group-hover:text-indigo-400\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" aria-hidden=\"true\">\n");
      out.write("                                    <path fill-rule=\"evenodd\" d=\"M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z\" clip-rule=\"evenodd\" />\n");
      out.write("                                    </svg>\n");
      out.write("                                </span>\n");
      out.write("                                    Sign in\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                            <div class=\"text-center text-md\">\n");
      out.write("                            <span style=\"color:red\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"text-grey-dark mt-6\">\n");
      out.write("                    Not yet have an account? \n");
      out.write("                    <a class=\"font-medium no-underline border-b border-blue text-indigo-600 hover:text-indigo-500\" href=\"ListOrganization.jsp\">\n");
      out.write("                        Create one for FREE \n");
      out.write("                    </a>!\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>       \n");
      out.write("    </body>    \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
