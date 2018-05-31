class CoursesController < ApplicationController
  before_action :current_user_must_be_course_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_course_user
    course = Course.find(params[:id])

    unless current_user == course.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @courses = Course.all

    render("courses/index.html.erb")
  end

  def show
    @course = Course.find(params[:id])

    render("courses/show.html.erb")
  end

  def new
    @course = Course.new

    render("courses/new.html.erb")
  end

  def create
    @course = Course.new

    @course.user_id = params[:user_id]
    @course.assignment_id = params[:assignment_id]

    save_status = @course.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/courses/new", "/create_course"
        redirect_to("/courses")
      else
        redirect_back(:fallback_location => "/", :notice => "Course created successfully.")
      end
    else
      render("courses/new.html.erb")
    end
  end

  def edit
    @course = Course.find(params[:id])

    render("courses/edit.html.erb")
  end

  def update
    @course = Course.find(params[:id])
    @course.assignment_id = params[:assignment_id]

    save_status = @course.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/courses/#{@course.id}/edit", "/update_course"
        redirect_to("/courses/#{@course.id}", :notice => "Course updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Course updated successfully.")
      end
    else
      render("courses/edit.html.erb")
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    if URI(request.referer).path == "/courses/#{@course.id}"
      redirect_to("/", :notice => "Course deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Course deleted.")
    end
  end
end
