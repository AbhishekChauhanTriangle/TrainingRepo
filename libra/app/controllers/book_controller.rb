class BookController < ApplicationController 

    #load_and_authorize_resource
    before_filter :authenticate_user!
	layout 'standard'


  def assign_subject
    @users =  User.joins(:roleusers).where("roleusers.roles_id = ?", 3)
    authorize! :assign_subject, UserSubject
  end

  def add_assign_subject
    authorize! :add_assign_subject, UserSubject
    params[:user_id].to_a.each do |key,val|
      val.to_a.each do |sub_id|
        UserSubject.create(user_id: key.to_i, subject_id: sub_id.to_i)
      end  
    end
    redirect_to :root
  end

  def assign_roles
    @users = User.all
    @roles = Roles.all
    roleusers = Roleuser.all

    @hash = Hash.new
    roleusers.each do |key|
        @hash[key.user_id] = key.roles_id
    end
    authorize! :assign_roles, Roleuser
    
  end

  def add_assign_roles
    authorize! :add_assign_roles, Roleuser
    params[:user_id].to_a.each do |key,val|
        Roleuser.create(user_id: key.to_i, roles_id: val.first.to_i)
    end
    redirect_to :root
  end

  def list

        #$redis.flushall
        if(!($redis.lrange("id",0,-1).count >= 5))
            id = Array.new
            name = Array.new
            subjects = Subject.all
            subjects.each do |s|
                id << s.id
                name << s.name
            end
            name1 = "id"
            name2 = "name"
            $redis.pipelined{ id.each{ |x| $redis.lpush(name1,x) } }
            $redis.pipelined{ name.each{ |x| $redis.lpush(name2,x) } }
        end


        
        @books = Book.all
        


        @isRoleAssigned = current_user.roleusers.blank?
        if(!@isRoleAssigned)
            role_id = current_user.roleusers.first.roles_id
            @role_type = Roles.select(:role_type).where("role_id = ?",role_id)
        end
        @currentTeacherSubjects = current_user.user_subjects
		respond_to do |format|
			format.html
			format.json {render :json => @books}
		end
        
   	end
   
    def show
		@book = Book.find(params[:id])

        respond_to do |format|
            format.html
            format.json {render :json => @book}
        end
    end
   
    def new

   		@book = current_user.books.new
   		@subjects = Subject.all
    end
   
    def create
    	@book = current_user.books.new(params[:books])

        respond_to do |format|
        	if @book.save
                format.html {redirect_to :action => 'list', :notice => 'Post was successfully created.'}
        		format.json {render :json => @book, :status => :created, :location => @book }
        	else
        		@subjects = Subject.all
                format.html {redirect_to :action => 'new'}
                format.json {render :json => @book.errors, :status => :unprocessable_entity}
        	end
        end
    end
   
    def edit
    	@book = Book.find(params[:id])
    	@subjects = Subject.all
    end
   
    def update
    	@book = Book.find(params[:id])
    	logger.debug('PARAMS HASH********'+params.to_s)
        respond_to do |format|
        	if @book.update_attributes(params[:book])
                format.html  { redirect_to :action => 'show', :id => @book ,:notice => 'Post was successfully updated.' }
                format.json  { head :no_content }
        	else
        		@subjects = Subject.all
                format.html  { render :action => "edit" }
                format.json  { render :json => @post.errors,:status => :unprocessable_entity }
        	end
        end
    end
   
    def delete
    	Book.find(params[:id]).destroy
        respond_to do |format|
            format.html { redirect_to :action => 'list' }
            format.json { head :no_content }
        end
    end

    def show_subjects
    	@subject = Subject.find(params[:id])    
        respond_to do |format|
            format.html
        #   format.json {render :json => @subject}
            format.json {render :json => @subject.books}
        end
    end
    
    def sendMail
        var = params[:mail]
        binding.pry
        HardWorker.perform_async(var)
        redirect_to :back, :alert => 'Email is on its way'
    end

end
