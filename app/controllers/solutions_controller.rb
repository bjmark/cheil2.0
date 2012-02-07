#encoding=utf-8
class SolutionsController < ApplicationController
  before_filter :cur_user , :check_right

  def check_right
    rpm =[:show,:approve,:unapprove]
    cheil = [:index,:show,:edit_rate,:update_rate,:create,:destroy,:send_to_rpm,:finish,:unfinish]
    vendor = [:show,:edit_rate,:update_rate]

    ok=case @cur_user.org
       when RpmOrg then rpm.include?(params[:action].to_sym)
       when CheilOrg then cheil.include?(params[:action].to_sym)
       when VendorOrg then vendor.include?(params[:action].to_sym)
       else false
       end
    ok or (raise SecurityError) 
  end

=begin
  def index
    if params[:brief_id]
      @brief = Brief.find(params[:brief_id])
      #raise SecurityError unless @brief.received_by?(@cur_user.org_id)
      @brief.check_create_solution_right(@cur_user.org_id)
    end
  end
=end
  def show
    @solution = Solution.find(params[:id])
    @solution.check_read_right(@cur_user.org_id)
    flash[:dest] = solution_path(@solution)
    
    @solution.op.read_by(@cur_user.id)
    
    case @cur_user.org
    when RpmOrg
      @payments = Payment.where(:solution_id=>@solution.id).all
      render 'solutions/rpm/show'

    when CheilOrg          #current user is a cheil user
      case
=begin
      when @solution.instance_of?(VendorSolution)         #show a vendor solution
        render 'solutions/cheil/vendor_solution/show'
=end
      when @solution.instance_of?(CheilSolution)           #show a cheil solution
        @payments = Payment.where(:solution_id=>@solution.id).all
        render 'solutions/cheil/cheil_solution/show'
      end

    when VendorOrg
      @money = @solution.money
      @payments = Payment.where(
        :solution_id=>@solution.brief.cheil_solution.id,
        :org_id=>@cur_user.org_id)
        render 'solutions/vendor/show'
    end

  end
=begin
  def edit_rate
    @solution = Solution.find(params[:id])
    @solution.check_edit_right(@cur_user.org_id)
  end

  def update_rate
    solution = Solution.find(params[:id])
    solution.check_edit_right(@cur_user.org_id)
    att = params[:vendor_solution] 
    solution.design_rate = att[:design_rate]
    solution.product_rate = att[:product_rate]
    solution.tran_rate = att[:tran_rate]
    solution.other_rate = att[:other_rate]
    solution.save

    redirect_to solution_path(solution)
  end
=end
=begin
  def create
    brief = Brief.find(params[:brief_id])
    brief.check_create_solution_right(@cur_user.org_id)

    vendor_ids = []
    params.each {|k,v| vendor_ids << v if k=~/vendor\d+/}
    vendor_ids.each do |org_id|
      brief.vendor_solutions << VendorSolution.new(:org_id=>org_id,:read_by=>@cur_user.id.to_s)
    end

    redirect_to solutions_path(:brief_id=>brief.id) 
  end
=end
=begin
  def destroy
    s = Solution.find(params[:id])
    brief = s.brief
    s.check_destroy_right(@cur_user.org_id)
    s.destroy

    redirect_to solutions_path(:brief_id=>brief.id) 
  end
=end
=begin
  def approve
    solution = Solution.find(params[:id])
    solution.check_approve_right(@cur_user.org_id)
    solution.is_approved = ((block_given? and yield) or 'y')
    solution.approved_at = Time.now
    solution.save

    brief = solution.brief
    brief.status = solution.is_approved == 'y' ? 3 : 2
    brief.save

    redirect_to solution_path(solution)
  end

  def unapprove
    approve{'n'}
  end
=end
=begin
  def set_status(solution,status_code)
    solution.check_edit_right(@cur_user.org.id)
    brief = solution.brief
    brief.status = status_code
    brief.save
  end
=end
=begin
  def send_to_rpm
    solution = Solution.find(params[:id])
    set_status(solution,2)
    redirect_to solution_path(solution)
  end
=end
=begin
  def finish
    solution = Solution.find(params[:id])
    set_status(solution,4)
    solution.finish_at = Time.new
    solution.save
    redirect_to solution_path(solution)
  end

  def unfinish
    solution = Solution.find(params[:id])
    set_status(solution,3)
    redirect_to solution_path(solution)
  end
=end
end
