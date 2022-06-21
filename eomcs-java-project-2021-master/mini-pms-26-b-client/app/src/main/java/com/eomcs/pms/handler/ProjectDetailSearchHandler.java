package com.eomcs.pms.handler;

import java.util.List;
import com.eomcs.pms.domain.Member;
import com.eomcs.pms.domain.Project;
import com.eomcs.pms.service.ProjectService;
import com.eomcs.util.Prompt;

public class ProjectDetailSearchHandler implements Command {

  ProjectService projectService;

  public ProjectDetailSearchHandler(ProjectService projectService) {
    this.projectService = projectService;
  }

  @Override
  public void service() throws Exception {
    System.out.println("[프로젝트 상세 검색]");

    String title = Prompt.inputString("프로젝트명?(조건에서 제외: 빈 문자열) ");
    String owner = Prompt.inputString("관리자명?(조건에서 제외: 빈 문자열) ");
    String member = Prompt.inputString("팀원?(조건에서 제외: 빈 문자열) ");

    List<Project> projects = projectService.search(title, owner, member);

    for (Project p : projects) {

      // 1) 프로젝트의 팀원 목록 가져오기
      StringBuilder strBuilder = new StringBuilder();
      List<Member> members = p.getMembers();
      for (Member m : members) {
        if (strBuilder.length() > 0) {
          strBuilder.append("/");
        }
        strBuilder.append(m.getName());
      }

      // 2) 프로젝트 정보를 출력
      System.out.printf("%d, %s, %s, %s, %s, [%s]\n", 
          p.getNo(), 
          p.getTitle(), 
          p.getStartDate(),
          p.getEndDate(),
          p.getOwner().getName(),
          strBuilder.toString());
    }
  }
}








