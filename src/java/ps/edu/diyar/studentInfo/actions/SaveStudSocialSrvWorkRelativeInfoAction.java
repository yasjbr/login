package ps.edu.diyar.studentInfo.actions;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import ps.edu.diyar.admission.component.CommonOperationMessage;
import ps.edu.diyar.common.tools.SessionTraker;
import ps.edu.diyar.studentInfo.database.struct.StudentInfoHolder;
import ps.edu.diyar.studentInfo.forms.SrvyWorkRelativeForm;
import ps.edu.diyar.studentInfo.useCase.SaveStudSrvWorkRelativeUseCase;

public class SaveStudSocialSrvWorkRelativeInfoAction
  extends Action
{
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    if (!SessionTraker.isSessionExist(request)) {
      return mapping.findForward("invalidAccess");
    }
    SrvyWorkRelativeForm inForm = (SrvyWorkRelativeForm)form;
    
    StudentInfoHolder studInfo = (StudentInfoHolder)((List)request.getSession().getAttribute("studentInfo")).get(0);
    

    request.setAttribute("liveIn", inForm.getWrlIsLiveIn());
    
    ArrayList input = new ArrayList();
    
    input.add(studInfo.getStudentId());
    input.add(studInfo.getSystemCurrentTermNo());
    input.add(inForm.getWrlIsLiveIn());
    input.add(inForm.getWrlRelativeName());
    input.add(inForm.getWrlWorkAddress());
    input.add(inForm.getWrlPhone());
    input.add(inForm.getWrlJob());
    input.add(inForm.getWrlCategory());
    input.add(inForm.getWrlSalary());
    input.add(inForm.getWrlFamilyContribute());
    input.add(inForm.getCounter());
    input.add(inForm.getOperType());
    
    Collection result = new SaveStudSrvWorkRelativeUseCase().execute(input, request);
    if ((result != null) && (result.size() > 0))
    {
      if ((inForm.getOperType() != null) && (inForm.getOperType().equals("3"))) {
        CommonOperationMessage.deleteFailed(request);
      } else {
        CommonOperationMessage.saveFailed(request);
      }
      request.setAttribute("viDvAdd", (inForm.getOperType() != null) && (!inForm.getOperType().equals("")) ? inForm.getOperType() : "1");
    }
    else
    {
      inForm.reset();
    }
    return mapping.findForward("success");
  }
}


/* Location:           C:\john_dreg\portal\diyar_portal.war\WEB-INF\classes\
 * Qualified Name:     ps.edu.diyar.studentInfo.actions.SaveStudSocialSrvWorkRelativeInfoAction
 * JD-Core Version:    0.7.0.1
 */