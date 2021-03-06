<%@ page import="ps.edu.diyar.common.tools.Randomizer" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/lib/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/lib/qou-Taglib.tld" prefix="qou" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%
  String term = null;
  if(request.getParameter("term") != null)
   term = request.getParameter("term");
  else if(request.getAttribute("term") != null)
   term = (String) request.getAttribute("term");
%>
<script>
function openPrintPage()
{
  var broswerName = new String(navigator.appName);
  if(broswerName.indexOf("Microsoft") >= 0)
    var win = window.open('tutorSchedulePrintPage.do?.rv=<%=Randomizer.shortRandom()%>&term=<%=term%>','','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=1000,height=300');
  else if(broswerName.indexOf("Netscape") >= 0)
    var win = window.open('../../tutor/tutorSchedulePrintPage.do?.rv=<%=Randomizer.shortRandom()%>&term=<%=term%>','','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=1000,height=300');
}
function setListSelection(selection, list)
{
  for(var i=0; i < list.options.length; i++)
  {
    if(list.options[i].value == selection)
    {
       list.selectedIndex = i;
       break;
    }
  }
}

</script>
<TABLE width="99%" border=0 align="center" cellPadding=0 cellSpacing=0>
  <TBODY>
    <TR>
      <TD><div align="center">
        <table width="100%" border="0">
          <tr>
           <td width="100%" valign="top">
             <br>
            <div align="right" class="centerpage">  جدول اللقاءات الاسبوعية</div>
            <TABLE cellPadding=0 cellSpacing=0 class="borderRoundedClearColor" width="100%">
             <TBODY><form name = "form1" action="../../tutor/showTutorTermSchedule.do?.rv=<%=Randomizer.shortRandom()%>" method="post">

              <TR>
                <TD>
                  <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
                    <TBODY>
                    <TR   vAlign=center>
                      <TD height=24>
                        <DIV align=center class="centerpage">

                       <!-- the terms navigation tags -->
                       <qou:TermListNavigator pageType="tutor/showTutorTermSchedule.do"/>

                      </DIV></TD>
                      <TD height=24>
                        <DIV align=center><INPUT class=enter name=Submit type=submit value=اذهب>

                        <SELECT class=bigList name="term">
                         <logic:present name="termsList">
                          <logic:iterate id="termsList" name="termsList" >
                                  <option value=<bean:write name="termsList" property="termNo"/>>
                                    <bean:write name="termsList" property="termName" />-
                                    <bean:write name="termsList" property="termNo" />
                                  </option>
                          </logic:iterate>
                         </logic:present>
                         </SELECT>
                       <script>setListSelection("<%=term%>", document.form1.term)</script>
                       </DIV></TD>
                       <TD height=24 width="18%" align="center" class="centerpage">الفصل الدراسي  :</TD>
                      </TR>
                     </TBODY>
                    </TABLE>
                   </TD>
                  </TR>

                </form>
                <tr><td>
                <form name="form2" action="../../tutor/viewTutorMessageAction.do?.rv=<%=Randomizer.shortRandom()%>" method="get">
                <div align="right">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0"  >
                    <tr>
                      <td >
                     <logic:present name="tutorTermSchedule">
                     <% int i = 0; %>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr class="tabheader">
                            <td width="15%"><div align="center">القاعة</div></td>
                            <%--<td width="13%"><div align="center">البناية</div></td>--%>
                            <td width="11%"><div align="center">الموعد</div></td>
                            <td width="5%"><div align="center">اليوم</div></td>
                            <td width="6%"><div align="center">الشعبة</div></td>
                            <td width="2%"><div align="center">س.م</div></td>
                            <td width="15%"><div align="center">اسم المقرر</div></td>
                            <td width="10%"><div align="center">المقرر/م</div></td>
                          </tr>
                     <logic:iterate id="TermSchedule" name="tutorTermSchedule" >
                         <%  if (i%2 == 0) { %>
                               <tr  class="tableRowClearColor"  onMouseOver="this.className='highlight'" onMouseOut="this.className='tableRowClearColor'">

                          <%}else {%>
                                <tr class="tableRowLightColor"  onMouseOver="this.className='highlight'" onMouseOut="this.className='tableRowLightColor'">
                          <%}%>

                           
                            <td class="qou"><div align="center"><bean:write name="TermSchedule" property="roomName"/></div></td>
                            <%--<td class="qou"><div align="center"><bean:write name="TermSchedule" property="buildingName"/></div></td>--%>
                            <td class="qou"><div align="center"><bean:write name="TermSchedule" property="beginTime"/> - <bean:write name="TermSchedule" property="endTime"/></div></td>
                            <td class="qou"><div align="center"><bean:write name="TermSchedule" property="dayName"/></div></td>
                            <td class="qou"><div align="center"><bean:write name="TermSchedule" property="classNo"/></div></td>
                            <td class="qou"><div align="center"><bean:write name="TermSchedule" property="courseHours"/></div></td>
                            <td class="qou"><div align="right"><bean:write name="TermSchedule" property="courseName"/></div></td>
                            <td class="qou"><div align="center"><bean:write name="TermSchedule" property="courseNo"/> </div></td>
                          </tr>
                      <% i++; %>
                     </logic:iterate>
                     </table>
                     </logic:present>
                      <logic:notPresent name="tutorTermSchedule">
                      <table width="100%" border="1" cellspacing="0" cellpadding="0" class="border" bordercolor="#4A6D8C">
                        <tr bgcolor="#EAF0F4" class="centerpage">
                          <td width="99%"><div align="center">&nbsp;  No Avaliable Data </div></td>
                         </tr>
                      </table>
                     </logic:notPresent>
                     </td>
                    </tr>
                  </table>
                   </div> </form></td>
            </tr>
           </TBODY></table>


                </td></tr>

                </TABLE>
             </div></td></tr>

                 <tr><td>
                 <br>

       </td></tr>


</TABLE>