package ps.edu.diyar.studentInfo.useCase;

import java.io.PrintStream;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import ps.edu.diyar.common.useCase.ComponentUseCase;
import ps.edu.diyar.studentInfo.database.struct.StudentInfoHolder;
import ps.edu.diyar.tutorInfo.component.TutorTermScheduleComponent;

public class ShowStudExamScheduleUseCase
  implements ComponentUseCase
{
  public Collection execute(Collection input, HttpServletRequest request)
    throws HibernateException
  {
    List retList = null;
    try
    {
      StudentInfoHolder studentInfo = (StudentInfoHolder)((Collection)request.getSession().getAttribute("studentInfo")).iterator().next();
      
      TutorTermScheduleComponent termSchedule = new TutorTermScheduleComponent();
      
      retList = termSchedule.getList("Portal.getStudExamSchedule", new Object[] { studentInfo.getSystemCurrentTermNo(), studentInfo.getStudentId() });
    }
    catch (Exception e)
    {
      e.printStackTrace();
      System.err.println("Error in the show ShowStudExamScheduleUseCase use case" + e);
    }
    return retList;
  }
}


/* Location:           C:\john_dreg\portal\diyar_portal.war\WEB-INF\classes\
 * Qualified Name:     ps.edu.diyar.studentInfo.useCase.ShowStudExamScheduleUseCase
 * JD-Core Version:    0.7.0.1
 */