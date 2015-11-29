class ExampleMailer < ActionMailer::Base
  default from: "mitul.manish@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: "Checking 123")
  end
  def workcreated_email(work)
    @work = work
    mail(to: work.project.owner.email, subject: "Work Item Posted")
  end

  def workupdated_email(work)
    @work = work
    mail(to: work.project.owner.email, subject: "Work Item Updated")
  end

  def projectupdated_email(project)
    @project = project
    mail(to: project.owner.email, subject: "Project Updated")
  end
end
