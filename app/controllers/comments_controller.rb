class CommentsController < ApplicationController
  def create
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.create(params[:comment])

	@count = 0
	@gpa = 0
	@hard = 0
	@score = 0
	
    @lecture.comments.each do |comment|
      @gpa = @gpa.to_f + comment.gpa
      @hard = @hard.to_f + comment.hard
      @score = @score.to_f + comment.score
	  @count = @count.to_i + 1
    end

	@lecture.gpa = @gpa.to_f / @count
	@lecture.hard = @hard.to_f / @count
	@lecture.score = @score.to_f / @count
    @lecture.save

    redirect_to lecture_path(@lecture)
  end  

  def destroy
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.find(params[:id])
    @comment.destroy
    redirect_to lecture_path(@lecture)
  end
end